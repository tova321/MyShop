using Entity;
using Microsoft.EntityFrameworkCore;
using Moq;
using Moq.EntityFrameworkCore;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Xunit;

namespace TestMyShop
{
    public class OrderUnitTest
    {
        [Fact]
        public async Task GetOrderById_ValidId_ReturnsOrder()
        {
            var order = new Order { Id = 1, UserId = 1, Date = DateTime.Now, Sum = 100.0 };
            var mockContext = new Mock<ShopContext>();
            mockContext.Setup(x => x.Orders).ReturnsDbSet(new List<Order> { order });
            var orderRepository = new OrderRepository(mockContext.Object);

            var result = await orderRepository.GetById(1);

            Assert.Equal(order, result);
        }


        [Fact]
        public async Task Post_ValidOrder_ReturnsOrderWithUser()
        {
            // Arrange
            var order = new Order { Id = 1, UserId = 1, Date = DateTime.Now };
            var user = new User { UserId = 1, FirstName = "John", LastName = "Doe" };
            order.User = user;

            var orders = new List<Order> { order };

            var mockContext = new Mock<ShopContext>();

            mockContext.Setup(x => x.Orders).ReturnsDbSet(orders);

            mockContext.Setup(x => x.Orders.AddAsync(It.IsAny<Order>(), default))
                       .ReturnsAsync((Microsoft.EntityFrameworkCore.ChangeTracking.EntityEntry<Order>)null);

            mockContext.Setup(x => x.SaveChangesAsync(default)).ReturnsAsync(1);

            var repository = new OrderRepository(mockContext.Object);

            // Act
            var result = await repository.Post(order);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(order.Id, result.Id);
            Assert.NotNull(result.User);
            Assert.Equal(user.UserId, result.User.UserId);
        }                                       
    }
   }