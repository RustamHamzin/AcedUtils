using System.ComponentModel.DataAnnotations;

namespace AdminPanel.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Логин обязателен")]
        public string Username { get; set; } = string.Empty;

        [Required(ErrorMessage = "Пароль обязателен")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;
    }
}