using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MyShop;
using NLog.Web;
using Repositories;
using Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IProductService, ProductService>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IOrderService, OrderService>();
builder.Services.AddScoped<IOrderRepository, OrderRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IRatingRepository, RatingRepository>();
builder.Services.AddScoped<IRatingService, RatingService>();
builder.Services.AddDbContext <ShopContext>(optionsBuilder => optionsBuilder.UseSqlServer("Server=SRV2\\PUPILS;Database=328300538_Shop;Trusted_Connection=True;TrustServerCertificate=True"));
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Host.UseNLog();


var app = builder.Build();


if (app.Environment.IsDevelopment()){
    app.UseSwagger();
    app.UseSwaggerUI();
}
// Configure the HTTP request pipeline.
app.UseRaitingMiddleware();

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseAuthorization();


app.MapControllers();

app.Run();

