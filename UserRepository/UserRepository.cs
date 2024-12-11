﻿using System.Runtime.InteropServices;
using Entity;
using Microsoft.EntityFrameworkCore;
namespace Repositories
{
    public class UserRepository : IUserRepository
    {
        UserContext userContext;

        public UserRepository(UserContext userContext)
        {
            this.userContext = userContext;
        }
        public async Task<User> Post(User user)                                           
        {
            //var res=await userContext.Users.AddAsync(user);
            await userContext.Users.AddAsync(user);
              await userContext.SaveChangesAsync();
            //return res- the created user with the id
            return user;
        }

        public async Task<User> PostLogin(string email, string password)
        {
            User user = await userContext.Users.FirstOrDefaultAsync(u => u.Email == email && u.Password == password);
            return user;
        }


        public async Task<User> Put(int id, User userToUpdate)
        {
            userContext.Users.Update(userToUpdate);
            await userContext.SaveChangesAsync();
            return userToUpdate;
        }

        public void Delete(int id)
        {
        }
    }
}
