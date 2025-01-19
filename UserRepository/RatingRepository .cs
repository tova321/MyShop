using Entities;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class RatingRepository : IRatingRepository
    {
        ShopContext shopContext;

        public RatingRepository(ShopContext shopContext)
        {
            this.shopContext = shopContext;
        }
        public async Task<Rating> Post(Rating rating)
        {
            await shopContext.Rating.AddAsync(rating);
            await shopContext.SaveChangesAsync();
            return rating;
        }
    }
}
