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
    public class OrdersController : ControllerBase
    {
        IOrderService orderService;
        IMapper mapper;
        public OrdersController(IOrderService orderService, IMapper mapper)
        {
            this.orderService = orderService;
            this.mapper = mapper;
        }


        // GET api/<OrdersController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> Get(int id)
        {
            var order= await orderService.GetById(id);
            if (order != null)
            {
                var orderDTO = mapper.Map<Order, OrderDTO>(order);
                return Ok(orderDTO);
            }

            return NoContent();
        }

        //// POST api/<OrdersController>
        //[HttpPost]
        //public async Task<IActionResult> Post([FromBody] PostOrderDTO newOrder)
        //{
        //    var order = mapper.Map<PostOrderDTO, Order>(newOrder);
        //    var order2 = await orderService.Post(order);
        //    if (order2 != null)
        //        return CreatedAtAction(nameof(Get), new { id = order2.Id }, order2);
        //    return BadRequest();

        //}

        //// POST api/<OrderController>
        //[HttpPost]
        //public async Task<ActionResult<Order>> Post([FromBody] PostOrderDTO order)
        //{

        //    Order order1 = mapper.Map<PostOrderDTO, Order>(order);
        //    Order order2 = await orderService.Post(order1);

        //    return Ok(order);



        //}

        // POST api/<OrderController>
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] PostOrderDTO orderDTO)
        {
            Order order = mapper.Map<PostOrderDTO, Order>(orderDTO);
            Order newOrder = await orderService.Post(order);
            OrderDTO orderdto = mapper.Map<Order, OrderDTO>(newOrder);
            return CreatedAtAction(nameof(Get), new { id = orderdto.Id }, orderdto);
        }

    }
}
