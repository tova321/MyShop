using Entity;

namespace Services
{
    public interface IProductService
    {
        Task<List<Product>> Get(int? minPrice, int? maxPrice, int?[] categoryIds,string? searchName);

    }
}