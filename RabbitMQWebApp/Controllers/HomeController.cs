using Microsoft.AspNetCore.Mvc;
using RabbitMQWebApp.Models;
using RabbitMQWebApp.Services;
using System.Diagnostics;

namespace RabbitMQWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IRabbitMQService _rabbitMQService;

        public HomeController(ILogger<HomeController> logger, IRabbitMQService rabbitMQService)
        {
            _logger = logger;
            _rabbitMQService = rabbitMQService;
        }

        public IActionResult Index()
        {
            var testData = GenerateTestData();
            return View(testData);
        }

        [HttpPost]
        public async Task<IActionResult> SendSelectedRecords([FromBody] int[] selectedIds)
        {
            try
            {
                if (selectedIds == null || selectedIds.Length == 0)
                {
                    return Json(new ApiResponse
                    {
                        Success = false,
                        Message = "Не выбрано ни одной записи для отправки"
                    });
                }

                var message = new SelectedRecordsMessage
                {
                    SelectedIds = selectedIds,
                    Timestamp = DateTime.UtcNow
                };

                var success = await _rabbitMQService.SendMessageAsync(message);

                if (success)
                {
                    _logger.LogInformation("Successfully sent {Count} selected records to RabbitMQ", selectedIds.Length);
                    return Json(new ApiResponse
                    {
                        Success = true,
                        Message = $"Успешно отправлено {selectedIds.Length} записей в очередь",
                        Data = new { Count = selectedIds.Length, Timestamp = message.Timestamp }
                    });
                }
                else
                {
                    return Json(new ApiResponse
                    {
                        Success = false,
                        Message = "Ошибка при отправке данных в RabbitMQ. Проверьте подключение к серверу."
                    });
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error sending selected records to RabbitMQ");
                return Json(new ApiResponse
                {
                    Success = false,
                    Message = "Произошла ошибка при обработке запроса"
                });
            }
        }

        [HttpGet]
        public async Task<IActionResult> TestConnection()
        {
            try
            {
                var isConnected = await _rabbitMQService.TestConnectionAsync();
                return Json(new ApiResponse
                {
                    Success = isConnected,
                    Message = isConnected ? "Подключение к RabbitMQ успешно" : "Не удалось подключиться к RabbitMQ"
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error testing RabbitMQ connection");
                return Json(new ApiResponse
                {
                    Success = false,
                    Message = "Ошибка при тестировании подключения"
                });
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        private List<DataRecord> GenerateTestData()
        {
            var statuses = new[] { "Активный", "Неактивный", "В обработке", "Завершен", "Отменен" };
            var names = new[] 
            { 
                "Заказ №1001", "Заказ №1002", "Заказ №1003", "Заказ №1004", "Заказ №1005",
                "Заказ №1006", "Заказ №1007", "Заказ №1008", "Заказ №1009", "Заказ №1010",
                "Заказ №1011", "Заказ №1012", "Заказ №1013", "Заказ №1014", "Заказ №1015"
            };

            var random = new Random();
            var records = new List<DataRecord>();

            for (int i = 1; i <= 15; i++)
            {
                records.Add(new DataRecord
                {
                    Id = i,
                    Name = names[i - 1],
                    Status = statuses[random.Next(statuses.Length)],
                    DateCreated = DateTime.Now.AddDays(-random.Next(1, 30)).AddHours(-random.Next(0, 24))
                });
            }

            return records;
        }
    }
}