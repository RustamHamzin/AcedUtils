using AdminPanel.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;

namespace AdminPanel.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var userRole = User.FindFirst(ClaimTypes.Role)?.Value;
            var cards = GetDashboardCards(userRole);
            
            ViewBag.UserRole = userRole;
            ViewBag.UserName = User.FindFirst("FullName")?.Value ?? User.Identity?.Name;
            
            return View(cards);
        }

        public IActionResult Contracts()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Admin"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Договора";
            return View("GenericPage");
        }

        public IActionResult Meters()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Admin"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Приборы учета";
            return View("GenericPage");
        }

        public IActionResult Readings()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Admin"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Показания";
            return View("GenericPage");
        }

        public IActionResult USZN()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Admin"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "УСЗН";
            return View("GenericPage");
        }

        public IActionResult Tasks()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Manager"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Мои задачи";
            return View("GenericPage");
        }

        public IActionResult Reports()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Manager"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Отчеты";
            return View("GenericPage");
        }

        public IActionResult Clients()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Manager"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Клиенты";
            return View("GenericPage");
        }

        public IActionResult MyContract()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Client"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Мой договор";
            return View("GenericPage");
        }

        public IActionResult MyReadings()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Client"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Мои показания";
            return View("GenericPage");
        }

        public IActionResult Appeals()
        {
            if (!User.HasClaim(ClaimTypes.Role, "Client"))
            {
                return Forbid();
            }
            
            ViewBag.PageTitle = "Обращения";
            return View("GenericPage");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        private List<DashboardCard> GetDashboardCards(string? role)
        {
            var random = new Random();
            
            return role switch
            {
                "Admin" => new List<DashboardCard>
                {
                    new DashboardCard { Title = "Всего договоров", Value = "1,247", Icon = "fas fa-file-contract", Color = "primary", Url = "/Home/Contracts" },
                    new DashboardCard { Title = "В обработке", Value = "156", Icon = "fas fa-clock", Color = "warning", Url = "/Home/Contracts" },
                    new DashboardCard { Title = "Размещено", Value = "23", Icon = "fas fa-check-circle", Color = "success", Url = "/Home/Contracts" },
                    new DashboardCard { Title = "Приборы учета", Value = "892", Icon = "fas fa-tachometer-alt", Color = "info", Url = "/Home/Meters" }
                },
                "Manager" => new List<DashboardCard>
                {
                    new DashboardCard { Title = "Задач в работе", Value = "15", Icon = "fas fa-tasks", Color = "primary", Url = "/Home/Tasks" },
                    new DashboardCard { Title = "Завершенных отчетов", Value = "5", Icon = "fas fa-chart-bar", Color = "success", Url = "/Home/Reports" },
                    new DashboardCard { Title = "Клиентов", Value = "127", Icon = "fas fa-users", Color = "info", Url = "/Home/Clients" },
                    new DashboardCard { Title = "Новых обращений", Value = "8", Icon = "fas fa-envelope", Color = "warning", Url = "/Home/Appeals" }
                },
                "Client" => new List<DashboardCard>
                {
                    new DashboardCard { Title = "Последнее показание", Value = "1,234 кВт", Icon = "fas fa-bolt", Color = "primary", Url = "/Home/MyReadings" },
                    new DashboardCard { Title = "Баланс", Value = "2,450 ₽", Icon = "fas fa-wallet", Color = "success", Url = "/Home/MyContract" },
                    new DashboardCard { Title = "К доплате", Value = "890 ₽", Icon = "fas fa-credit-card", Color = "warning", Url = "/Home/MyContract" },
                    new DashboardCard { Title = "Мои обращения", Value = "2", Icon = "fas fa-comments", Color = "info", Url = "/Home/Appeals" }
                },
                _ => new List<DashboardCard>()
            };
        }
    }
}