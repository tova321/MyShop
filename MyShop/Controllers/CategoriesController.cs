using AutoMapper;
using DTO;
using Entity;
using Microsoft.AspNetCore.Mvc;
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

        public CategoriesController(ICategoryService categoryService,IMapper mapper)
        {
            this.categoryService = categoryService;
            this.mapper = mapper;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async  Task<ActionResult<List<CategoryDTO>>> Get()
        {
            var categories = await categoryService.Get();
            if (categories != null)
            {
                var categoriesDTO = mapper.Map<List<Category>, List<CategoryDTO>>(categories);
                return Ok(categoriesDTO);
            }

            return BadRequest();
        }

      

    }
}
