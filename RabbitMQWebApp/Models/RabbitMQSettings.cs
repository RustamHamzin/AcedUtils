namespace RabbitMQWebApp.Models
{
    public class RabbitMQSettings
    {
        public string HostName { get; set; } = "localhost";
        public int Port { get; set; } = 5672;
        public string UserName { get; set; } = "guest";
        public string Password { get; set; } = "guest";
        public string QueueName { get; set; } = "selected_records_queue";
        public string ExchangeName { get; set; } = "selected_records_exchange";
        public string RoutingKey { get; set; } = "selected_records";
    }
}