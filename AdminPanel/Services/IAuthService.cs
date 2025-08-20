using AdminPanel.Models;

namespace AdminPanel.Services
{
    public interface IAuthService
    {
        string GenerateJwtToken(User user);
        User? AuthenticateUser(string username, string password);
    }
}