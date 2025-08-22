using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using RabbitMQWebApp.Models;
using System.Text;

namespace RabbitMQWebApp.Services
{
    public class RabbitMQService : IRabbitMQService, IDisposable
    {
        private readonly RabbitMQSettings _settings;
        private readonly ILogger<RabbitMQService> _logger;
        private IConnection? _connection;
        private IModel? _channel;
        private readonly object _lock = new object();

        public RabbitMQService(IOptions<RabbitMQSettings> settings, ILogger<RabbitMQService> logger)
        {
            _settings = settings.Value;
            _logger = logger;
        }

        private async Task<bool> EnsureConnectionAsync()
        {
            if (_connection?.IsOpen == true && _channel?.IsOpen == true)
                return true;

            lock (_lock)
            {
                try
                {
                    // Dispose existing connections
                    _channel?.Dispose();
                    _connection?.Dispose();

                    // Create new connection
                    var factory = new ConnectionFactory()
                    {
                        HostName = _settings.HostName,
                        Port = _settings.Port,
                        UserName = _settings.UserName,
                        Password = _settings.Password,
                        RequestedHeartbeat = TimeSpan.FromSeconds(60),
                        NetworkRecoveryInterval = TimeSpan.FromSeconds(10),
                        AutomaticRecoveryEnabled = true
                    };

                    _connection = factory.CreateConnection();
                    _channel = _connection.CreateModel();

                    // Declare exchange and queue
                    _channel.ExchangeDeclare(
                        exchange: _settings.ExchangeName,
                        type: ExchangeType.Direct,
                        durable: true);

                    _channel.QueueDeclare(
                        queue: _settings.QueueName,
                        durable: true,
                        exclusive: false,
                        autoDelete: false,
                        arguments: null);

                    _channel.QueueBind(
                        queue: _settings.QueueName,
                        exchange: _settings.ExchangeName,
                        routingKey: _settings.RoutingKey);

                    _logger.LogInformation("RabbitMQ connection established successfully");
                    return true;
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to establish RabbitMQ connection");
                    return false;
                }
            }
        }

        public async Task<bool> SendMessageAsync<T>(T message) where T : class
        {
            try
            {
                if (!await EnsureConnectionAsync())
                {
                    _logger.LogError("Cannot send message: RabbitMQ connection not available");
                    return false;
                }

                var json = JsonConvert.SerializeObject(message, Formatting.Indented);
                var body = Encoding.UTF8.GetBytes(json);

                var properties = _channel!.CreateBasicProperties();
                properties.Persistent = true;
                properties.ContentType = "application/json";
                properties.Timestamp = new AmqpTimestamp(DateTimeOffset.UtcNow.ToUnixTimeSeconds());

                _channel.BasicPublish(
                    exchange: _settings.ExchangeName,
                    routingKey: _settings.RoutingKey,
                    basicProperties: properties,
                    body: body);

                _logger.LogInformation("Message sent to RabbitMQ successfully. Queue: {QueueName}", _settings.QueueName);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to send message to RabbitMQ");
                return false;
            }
        }

        public async Task<bool> TestConnectionAsync()
        {
            return await EnsureConnectionAsync();
        }

        public void Dispose()
        {
            try
            {
                _channel?.Close();
                _channel?.Dispose();
                _connection?.Close();
                _connection?.Dispose();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error disposing RabbitMQ connection");
            }
        }
    }
}