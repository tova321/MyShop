using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Repositories;
using Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddDbContext < UserContext>(optionsBuilder => optionsBuilder.UseSqlServer("Server=SRV2\\PUPILS;Database=328300538_Shop;Trusted_Connection=True;TrustServerCertificate=True"));
builder.Services.AddControllers();

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseAuthorization();

app.MapControllers();

app.Run();
