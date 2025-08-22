namespace RabbitMQWebApp.Models
{
    public class SelectedRecordsMessage
    {
        public int[] SelectedIds { get; set; } = Array.Empty<int>();
        public DateTime Timestamp { get; set; }
    }
}