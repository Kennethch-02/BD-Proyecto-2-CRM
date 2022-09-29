using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options) {
        }
        public DbSet<Usuario> Usuario { get; set; }
    }
    //public class Prueba{
    //     public int Id { get; set; }
    //}
    public class Usuario {
        [Key]
        public string cedula { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string departamento { get; set; }
        public string clave { get; set; }
        public string rol { get; set; }
    }
}
