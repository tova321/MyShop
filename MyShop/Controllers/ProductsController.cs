using Microsoft.AspNetCore.Mvc;
using Entity;
using Services;
using AutoMapper;
using DTO;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly ILogger<UsersController> logger;
        IProductService productService;
        IMapper mapper;
        public ProductsController(IProductService productService, IMapper mapper, ILogger<UsersController> logger)
        {
            this.productService = productService;
            this.mapper = mapper;
            this.logger = logger;
            logger.LogInformation("the aplication is up!");
        }

        // GET: api/<ProductsController>
        [HttpGet]

        public async Task<ActionResult< List<Product>>>Get([FromQuery]int minPrice, [FromQuery] int? maxPrice, [FromQuery] int?[]categoryIds, [FromQuery] string? searchName)
        {
            var products= await productService.Get(minPrice, maxPrice, categoryIds,searchName);
            if (products != null)
            {
                var producsDTO = mapper.Map<List<Product>, List<ProductDTO>>(products);
                return Ok(producsDTO);
            }
        
            return BadRequest();
 
        }

       
    }
}
