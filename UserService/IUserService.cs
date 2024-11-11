using MyShop;

namespace Services
{
    public interface IUserService
    {
        void Delete(int id);
        User Post(User user);
        User PostLogin(string email, string password);
        int PostPassword(string password);
        User Put(int id, User userToUpdate);
    }
}