using Entity;

namespace Repositories
{
    public interface IProductRepository
    {
        Task<List<Product>> Get(int? minPrice, int? maxPrice, int?[] categoryIds, string? searchName);
    }
}