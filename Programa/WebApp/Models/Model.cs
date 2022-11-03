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
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<Contacto> Contacto { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Cotizacion> Cotizacion { get; set; }
        public DbSet<Modulo> Modulo { get; set; }
        public DbSet<Moneda> Moneda { get; set; }
        public DbSet<ZonaSector> ZonaSector { get; set; }
        public DbSet<TipoCaso> TipoCaso { get; set; }
        public DbSet<Prioridad> Prioridad { get; set; }
        public DbSet<Etapa> Etapa { get; set; }
        public DbSet<Probabilidad> Probabilidad { get; set; }
        public DbSet<TipoCotizacion> TipoCotizacion { get; set; }
        public DbSet<Inflacion> Inflacion { get; set; }
        public DbSet<Asesor> Asesor { get; set; }
        public DbSet<EstadoContacto> EstadoContacto { get; set; }
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

    public class Cliente
    {
        [Key]
        public string nombreDeUsuario { get; set; }
        public string correoElectronico { get; set; }
        public string contactoPrincipal { get; set; }
        public int moneda { get; set; }
        public string telefono { get; set; }
        public string celular { get; set; }
        public string sitioWeb { get; set; }
        public string infoAdicional { get; set; }
        public string asesor { get; set; }
        public int zonaSector { get; set; }

    }

    public class Contacto
    {
        [Key]
        public string nombre { get; set; }
        public string cliente { get; set; }
        public Int16 tipo { get; set; }
        public string motivo { get; set; }
        public string telefono { get; set; }
        public string correoElectronico { get; set; }
        public Int16 estado { get; set; }
        public string direccion { get; set; }
        public Int16 zonaSector { get; set; }
        public string asesor { get; set; }
        public string descripcion { get; set; }
        public Int16 idModulo { get; set; }
    }

    public class Producto
    {
        [Key]
        public string codigo { get; set; }
        public string nombre { get; set; }
        public Int16 activo { get; set; }
        public string descripcion { get; set; }
        public string familia { get; set; }
        public float precioEstandar { get; set; }
    }

    public class Cotizacion
    {
        [Key]
        public string numero { get; set; }
        public string nombreOportunidad { get; set; }
        public string fecha { get; set; }
        public string nombreCuenta { get; set; }
        public string mesAnnoProyectado { get; set; }
        public string asesor { get; set; }
        public string fechaCierre { get; set; }
        public Int16 etapa { get; set; }
        public Int16 moneda { get; set; }
        public Int16 probabilidad { get; set; }
        public string ordenCompra { get; set; }
        public Int16 tipo { get; set; }
        public string descripcion { get; set; }
        public Int16 zonaSector { get; set; }
        public string contacto { get; set; }
        public string numeroFactura { get; set; }
        public Int16 estado { get; set; }
        public Int16 inflacion { get; set; }
    }
    public class Modulo
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
    public class Moneda
    {
        [Key]
        public Int16 id { get; set; }
        public string nombre { get; set; }
    }
    public class ZonaSector
    {
        [Key]
        public Int16 id { get; set; }
        public string zona { get; set; }
        public string sector { get; set; }
    }
    public class TipoCaso
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
    public class Prioridad
    {
        [Key]
        public Int16 id { get; set; }
        public string prioridad { get; set; }
    }
    public class Etapa
    {
        [Key]
        public Int16 id { get; set; }
        public string etapa { get; set; }
    }
    public class Probabilidad
    {
        [Key]
        public Int16 id { get; set; }
        public Int16 porcentaje { get; set; }
    }
    public class TipoCotizacion
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
    public class Inflacion
    {
        [Key]
        public Int16 id { get; set; }
        public Int16 porcentaje { get; set; }
    }
    public class Asesor
    {
        [Key]
        public Int16 id { get; set; }
        public string cedula { get; set; }
    }
    public class EstadoContacto
    {
        [Key]
        public Int16 id { get; set; }
        public string estado { get; set; }
    }
}
