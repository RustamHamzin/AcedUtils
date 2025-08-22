namespace RabbitMQWebApp.Services
{
    public interface IRabbitMQService
    {
        Task<bool> SendMessageAsync<T>(T message) where T : class;
        Task<bool> TestConnectionAsync();
    }
}