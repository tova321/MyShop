using Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        ShopContext shopContext;

        public CategoryRepository(ShopContext shopContext)
        {
            this.shopContext = shopContext;
        }

        public async Task<List<Category>> Get()
        {
            var categories = await shopContext.Categories.ToListAsync<Category>();
            return categories;
        }

    }
}
