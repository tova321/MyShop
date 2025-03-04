using AutoMapper;
using DTO;
using Entity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        ICategoryService categoryService;
        IMapper mapper;
        private readonly IMemoryCache cache; 
        private const string CacheKey = "categoriesCache";

        public CategoriesController(ICategoryService categoryService,IMapper mapper, IMemoryCache cache)
        {
            this.categoryService = categoryService;
            this.mapper = mapper;
            this.cache = cache;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<ActionResult<List<CategoryDTO>>> Get()
        {
            if (!cache.TryGetValue("categoriesCache", out List<Category> categories))
            {
                categories = await categoryService.Get();
                cache.Set("categoriesCache", categories, TimeSpan.FromMinutes(30));
            }

            List<CategoryDTO> categoriesDTO = mapper.Map<List<Category>, List<CategoryDTO>>(categories);
            return Ok(categoriesDTO);

        }



    }
}
