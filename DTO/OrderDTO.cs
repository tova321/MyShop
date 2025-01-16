using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
namespace DTO
{
    public record OrderDTO(int Id,string UserFirstName, DateTime? Date, double? Sum, ICollection<OrderItemDTO> OrderItems);
    public record PostOrderDTO(int UserId, DateTime? Date, double? Sum, ICollection<OrderItemDTO> OrderItems);


}
