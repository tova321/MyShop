using System.Collections.Generic;
using System.Runtime.InteropServices;
using Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
namespace Repositories
{
    public class ProductRepository : IProductRepository
    {
        ShopContext shopContext;

        public ProductRepository(ShopContext shopContext)
        {
            this.shopContext = shopContext;
        }
        public async Task<List<Product>> Get(int? minPrice,int? maxPrice, int?[]categoryIds,string? searchName)
        {
            var query = shopContext.Products.Where(product =>
                ((minPrice == null) ? (true) : (product.Price >= minPrice))
                && ((maxPrice == null) ? (true) : (product.Price <= maxPrice))
                && ((searchName == null) ? (true) : (product.Name.Contains(searchName)))
                && ((categoryIds.Length == 0) ? (true) : (categoryIds.Contains(product.CategoryId))))
               .OrderBy(product => product.Price);

            List<Product> products = await query.ToListAsync();
            return products;
        }


    }
}
