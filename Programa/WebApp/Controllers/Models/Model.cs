using Microsoft.EntityFrameworkCore;

namespace WebApp.Controllers.Models
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options) {
        }
        //public DbSet<Prueba> Prueba { get; set; }
    }
   //public class Prueba{
   //     public int Id { get; set; }
   //}
}
