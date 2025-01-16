using Entity;

namespace Repositories
{
    public interface IUserRepository
    {
        Task<User> Post(User user);
        Task<User> PostLogin(string email, string password);
        Task<User> Put(int id, User userToUpdate);
        Task<User> GetById(int id);
    }
}