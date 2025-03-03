using Entity;
using Microsoft.EntityFrameworkCore;
using Moq;
using Moq.EntityFrameworkCore;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace TestMyShop
{
    public class ProductUnitTest
    {
        [Fact]
        public async Task Get_ValidParameters_ReturnsFilteredProducts()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { Id = 1, Name = "Product1", Price = 50, CategoryId = 1 },
                new Product { Id = 2, Name = "Product2", Price = 150, CategoryId = 2 },
                new Product { Id = 3, Name = "Product3", Price = 250, CategoryId = 1 }
            };
            var mockContext = new Mock<ShopContext>();
            mockContext.Setup(x => x.Products).ReturnsDbSet(products);
            var productRepository = new ProductRepository(mockContext.Object);

            // Act
            var result = await productRepository.Get(100, 200, new int?[] { 1 }, "Product");

            // Assert
            Assert.NotNull(result);
            Assert.Single(result);
            Assert.Equal(2, result.First().Id);
        }


    }
}

