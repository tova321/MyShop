using Entity;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class OrderService : IOrderService
    {
        IOrderRepository orderRepository;
        IProductRepository productRepository;

        public OrderService(IOrderRepository orderRepository, IProductRepository productRepository)
        {
            this.orderRepository = orderRepository;
            this.productRepository = productRepository;
        }
        public async Task<Order> GetById(int id)
        {
            return await orderRepository.GetById(id);
        }
        private async Task<double> checkSum(List<OrderItem> orderItems)
        {
            double sum = 0;
            foreach (var item in orderItems)
            {
                sum += await productRepository.GetProductPriceById(item.ProductId) * item.Quantity;
            }
            return sum;
        }
        public async Task<Order> Post(Order order)
        {
            double calculateSum=await checkSum(order.OrderItems.ToList());
            if (calculateSum != order.Sum)
                return null;
            return await orderRepository.Post(order);
        }

    }
}
