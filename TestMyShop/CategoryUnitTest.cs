using Entity;
using Moq;
using Moq.EntityFrameworkCore;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestMyShop
{
    public class CategoryUnitTest
    {
        [Fact]
        public async Task GetCategories_ReturnsListOfCategories()
        {
            var categories = new List<Category>
            {
                new Category { Id = 1, Name = "Electronics" },
                new Category { Id = 2, Name = "Books" }
            };
            var mockContext = new Mock<ShopContext>();
            mockContext.Setup(x => x.Categories).ReturnsDbSet(categories);
            var categoryRepository = new CategoryRepository(mockContext.Object);

            var result = await categoryRepository.Get();

            Assert.Equal(categories, result);
        }
    }
}
