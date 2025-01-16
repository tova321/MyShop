using AutoMapper;
using Entity;
using DTO;
namespace MyShop
{
    public class Mapper:Profile
    {
        public Mapper()
        {
            CreateMap<User, UserDTO>();
            CreateMap<Category, CategoryDTO>();
            CreateMap<Order, OrderDTO>();
            CreateMap<OrderItemDTO, OrderItem>().ReverseMap();
            CreateMap<Product, ProductDTO>();
            CreateMap<PostOrderDTO, Order>();
            CreateMap<PostUserDTO, User>();
            
        }

    }
}
