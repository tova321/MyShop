using Entity;
using System.Runtime.InteropServices;
using System.Text.Json;
using Repositories;
using Zxcvbn;

namespace Services
{
    public class ProductService : IProductService
    {

        IProductRepository productRepository;

        public ProductService(IProductRepository productRepository)
        {
            this.productRepository = productRepository;
        }
        public async Task<List<Product>> Get(int? minPrice, int? maxPrice, int?[] categoryIds,string? searchName)
        { 
            return await productRepository.Get(minPrice, maxPrice, categoryIds,searchName);
        }

    }
}
