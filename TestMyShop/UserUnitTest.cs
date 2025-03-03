using System.Reflection.Metadata;
using Entity;
using Repositories;
using Moq;
using Moq.EntityFrameworkCore;

namespace TestMyShop
{
    public class UserUnitTest
    {
        [Fact]
        public async Task GetUser_ValidCredentials_ReturnsUser()
        {
            var user = new User { Email = "Miryam@gmail.com", Password = "bg742tq7ubehuifuihfdshu" };
            var mockContext = new Mock<ShopContext>();
            var users = new List<User>() { user };
            mockContext.Setup(x => x.Users).ReturnsDbSet(users);
            var userRepository = new UserRepository(mockContext.Object);

            var result = await userRepository.PostLogin(user.Email, user.Password);

            Assert.Equal(user, result);
        }
    }
}