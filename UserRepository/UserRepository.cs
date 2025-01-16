using System.Runtime.InteropServices;
using Entity;
using Microsoft.EntityFrameworkCore;
namespace Repositories
{
    public class UserRepository : IUserRepository
    {
        ShopContext userContext;

        public UserRepository(ShopContext userContext)
        {
            this.userContext = userContext;
        }
        public async Task<User> GetById(int id)
        {
            var user=await userContext.Users.FirstOrDefaultAsync(u=>u.UserId==id);
            return user;
        }
        public async Task<User> Post(User user)                                           
        {
              await userContext.Users.AddAsync(user);
              await userContext.SaveChangesAsync();
              return user;
        }

        public async Task<User> PostLogin(string email, string password)
        {
            User user = await userContext.Users.FirstOrDefaultAsync(u => u.Email == email && u.Password == password);
            return user;
        }


        public async Task<User> Put(int id, User userToUpdate)
        {
            userToUpdate.UserId = id;
            userContext.Users.Update(userToUpdate);
            await userContext.SaveChangesAsync();
            return userToUpdate;
        }


    }
}
