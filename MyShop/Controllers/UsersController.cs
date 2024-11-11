using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Services;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        IUserService userService;

        public UsersController(IUserService userService)
        {
            this.userService=userService;
        }

        // GET: api/<Users>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "Shbat", "Shalom" };
        }

        // GET api/<Users>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<Users>
        [HttpPost]
        public ActionResult<User> Post([FromBody] User user)
        {
            var res=userService.Post(user);
            return CreatedAtAction(nameof(Get), new { id = user.UserId }, user);
        }

        [HttpPost]
        [Route("login")]
        public ActionResult<User> PostLogin([FromQuery] string email, string password)
        {
            User newUser = userService.PostLogin(email,password);
            if (newUser != null)
                return Ok(newUser);

            return NoContent();

        }

        [HttpPost]
        [Route("password")]
        public int PostPassword([FromQuery] string password)
        {
            return userService.PostPassword(password);
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] User userToUpdate)
        {
            userService.Put(id, userToUpdate);
            if (userToUpdate != null)
                return Ok();
            return BadRequest();

        }

        // DELETE api/<Users>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
