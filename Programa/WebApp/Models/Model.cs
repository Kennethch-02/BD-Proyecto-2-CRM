using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options) {
        }
        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Rol> Rol { get; set; }
        public DbSet<Departamento> Departamento { get; set; }
    }
    //public class Prueba{
    //     public int Id { get; set; }
    //}
    public class Usuario {
        [Key]
        public string cedula { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public Int16 departamento { get; set; }
        public string clave { get; set; }
        public Int16 rol { get; set; }
    }
    public class Rol
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
    public class Departamento
    {
        [Key]
        public Int16 id { get; set; }
        public string nombre { get; set; }
    }
}
