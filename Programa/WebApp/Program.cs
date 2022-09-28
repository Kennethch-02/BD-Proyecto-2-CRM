using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using WebApp.Controllers.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
SqlConnectionStringBuilder connectS = new();

// Constuccion de la variable coneccion
connectS.DataSource = "KENNETHPC";
connectS.InitialCatalog = "SistemaCRM";
connectS.IntegratedSecurity = true;

// Coneccion a la base de datos
var connection = connectS.ConnectionString;
builder.Services.AddDbContext<MyDBContext>(options => options.UseSqlServer(connection));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();



app.MapControllerRoute(
    name: "default",
    pattern: "{controller}/{action=Index}/{id?}");

app.MapFallbackToFile("index.html"); ;

app.Run();
