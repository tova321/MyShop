using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Services;
using Entity;
using AutoMapper;
using DTO;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ILogger<UsersController> logger;
        IUserService userService;
        IMapper mapper;
        public UsersController(IUserService userService, IMapper mapper, ILogger<UsersController>logger)
        {
            this.userService=userService;
            this.mapper = mapper;
            this.logger = logger;
        }


        // GET api/<Users>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserDTO>> GetById(int id)
        {
            var user =await userService.GetById(id);
            if (user != null)
            {
                var userDTO = mapper.Map<User, UserDTO>(user);
                return Ok(userDTO);
            }

            return NoContent();
        }
        // POST api/<Users>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PostUserDTO userDTO)
        {
            var user = mapper.Map<PostUserDTO, User>(userDTO);
            var userdto= await userService.Post(user);
            if (userdto != null)
            {
                UserDTO newUser = mapper.Map<User, UserDTO>(userdto);
                return CreatedAtAction(nameof(GetById), new { id = userdto.UserId }, user);
            }

            return BadRequest();
        }

        [HttpPost]
        [Route("login")]
        public async Task<ActionResult<User>> PostLogin([FromQuery] string email, string password)
        {
            var newUser =await userService.PostLogin(email,password);
            if (newUser != null)
            {
                UserDTO fullUser = mapper.Map<User, UserDTO>(newUser);
                logger.LogInformation($"Login attempted with User Name ,{email} and Password {password}");
                return Ok(fullUser);
            }

            return NoContent();

        }

        [HttpPost]
        [Route("password")]
        public int PostPassword([FromQuery] string password)
        {
            return  userService.PostPassword(password);
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id, [FromBody] PostUserDTO userToUpdate)
        {
            User newUser = mapper.Map<PostUserDTO, User>(userToUpdate);
            var updateUser= await userService.Put(id, newUser);
            if (updateUser != null)
                return Ok();

            return BadRequest();

        }


    }
}
