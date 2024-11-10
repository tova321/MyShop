﻿using MyShop;
using System.Runtime.InteropServices;
using System.Text.Json;
using Repositories;
using Zxcvbn;

namespace Services
{
    public class UserService : IUserService
    {

        IUserRepository userRepository;

        public UserService(IUserRepository userRepository)
        {
            this.userRepository=userRepository;
        }

        public User Post(User user)
        {
            var result = Zxcvbn.Core.EvaluatePassword(user.Password);

            if (result.Score < 3)
            {
                return null;
            }
            return userRepository.Post(user);
        }


        public User PostLogin(string email, string password)
        {
            return userRepository.PostLogin(email, password);
        }

        public User Put(int id, User userToUpdate)
        {
            return userRepository.Put(id, userToUpdate);
        }


        public void Delete(int id)
        {

        }
    }
}