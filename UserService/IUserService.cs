using Entity;

namespace Services
{
    public interface IUserService
    {
        Task<User> Post(User user);
        Task<User> PostLogin(string email, string password);
        int PostPassword(string password);
        Task<User> Put(int id, User userToUpdate);
        Task<User> GetById(int id);
    }
}