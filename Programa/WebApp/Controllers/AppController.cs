using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Query.Internal;
using WebApp.Controllers.Models;
using WebApp.Controllers.Models.ViewModels;
using WebApp.Models.ViewModels;

namespace WebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AppController : Controller
    {
        private Models.MyDBContext db;

        public AppController(Models.MyDBContext context) {
            db = context;
        }
        //Agregar valores mediante procedimientos almacenados
        [HttpGet("[action]/{cedula}/{nombre}/{apellidos}/{departamento}/{clave}/{rol}/{modo}")]
        public IAsyncEnumerable<Usuario> UsuarioProc(string cedula, string nombre, string apellidos, Int16 departamento, string clave, Int16 rol, char modo)
        {
            string exec = String.Format("Exec UsuarioProc '{0}','{1}','{2}','{3}','{4}','{5}','{6}'", cedula, nombre, apellidos, departamento, clave, rol, modo);
            return db.Usuario.FromSqlRaw(exec).AsAsyncEnumerable();
        }
        [HttpGet("[action]")]
        public IEnumerable<UserViewModel> Usuarios () {
            List<UserViewModel> users = (from d in db.Usuario
                                         select new UserViewModel {
                                             cedula = d.cedula,
                                             nombre = d.nombre,
                                             apellidos = d.apellidos,
                                             departamento = d.departamento,
                                             clave = d.clave,
                                             rol = d.rol,
                                         }).ToList();
            return users;
        }
        [HttpGet("[action]")]
        public IEnumerable<RolViewModel> Rol()
        {
            List<RolViewModel> rols = (from d in db.Rol
                                         select new RolViewModel
                                         {
                                             id = d.id,
                                             tipo = d.tipo,
                                         }).ToList();
            return rols;
        }

        [HttpGet("[action]")]
        public IEnumerable<DepartamentoViewModel> Departamento()
        {
            List<DepartamentoViewModel> departamentos = (from d in db.Departamento
                                       select new DepartamentoViewModel
                                       {
                                           id = d.id,
                                           nombre = d.nombre,
                                       }).ToList();
            return departamentos;
        }
        [HttpGet("[action]")]
        public IEnumerable<ClienteViewModel> Cliente()
        {
            List<ClienteViewModel> clientes = (from d in db.Cliente
                                         select new ClienteViewModel
                                         {
                                             nombreDeUsuario = d.nombreDeUsuario,
                                             correoElectronico = d.correoElectronico,
                                             contactoPrincipal = d.contactoPrincipal,
                                             moneda = (short)d.moneda,
                                             telefono = d.telefono,
                                             celular = d.celular,
                                             sitioWeb = d.sitioWeb,
                                             infoAdicional = d.infoAdicional,
                                             asesor = d.asesor,
                                             zonaSector = (short)d.zonaSector,
                                         }).ToList();
            return clientes;
        }
        [HttpGet("[action]")]
        public IEnumerable<ContactoViewModel> Contacto()
        {
            List<ContactoViewModel> contactos = (from d in db.Contacto
                                                select new ContactoViewModel
                                                {
                                                   nombre = d.nombre,
                                                   cliente = d.cliente,
                                                   tipo = d.tipo,
                                                   motivo = d.motivo,
                                                   telefono = d.telefono,
                                                   correoElectronico = d.correoElectronico,
                                                   estado = d.estado,
                                                   direccion = d.direccion,
                                                   zonaSector = d.zonaSector,
                                                   asesor = d.asesor,
                                                   descripcion = d.descripcion,
                                                   idModulo = d.idModulo,
                                               }).ToList();
            return contactos;
        }
        [HttpGet("[action]")]
        public IEnumerable<ProductoViewModel> Producto()
        {
            List<ProductoViewModel> productos = (from d in db.Producto
                                                select new ProductoViewModel
                                                {
                                                   codigo = d.codigo,
                                                   nombre = d.nombre,
                                                   activo = d.activo,
                                                   descripcion = d.descripcion,
                                                   familia = d.familia,
                                                   precioEstandar = d.precioEstandar,
                                               }).ToList();
            return productos;
        }
        [HttpGet("[action]")]
        public IEnumerable<CotizacionViewModel> Cotizacion()
        {
            List<CotizacionViewModel> cotizaciones = (from d in db.Cotizacion
                                                   select new CotizacionViewModel
                                                   {
                                                     numero = d.numero,
                                                     nombreOportunidad = d.nombreOportunidad,
                                                     fecha = d.fecha,
                                                     nombreCuenta = d.nombreCuenta,
                                                     mesAñoProyectado = d.mesAñoProyectado,
                                                     asesor = d.asesor,
                                                     fechaCierre = d.fechaCierre,
                                                     etapa = d.etapa,
                                                     moneda = d.moneda,
                                                     probabilidad = d.probabilidad,
                                                     ordenCompra = d.ordenCompra,
                                                     tipo = d.tipo,
                                                     descripcion = d.descripcion,
                                                     zonaSector = d.zonaSector,
                                                     contacto = d.contacto,
                                                     numeroFactura = d.numeroFactura,
                                                     estado = d.estado,
                                                     inflacion = d.inflacion,
                                                   }).ToList();
            return cotizaciones;
        }
        [HttpGet("[action]")]
        public IEnumerable<ModuloViewModel> Modulo()
        {
            List<ModuloViewModel> modulos = (from d in db.Modulo
                                             select new ModuloViewModel
                                             {
                                                 id = d.id,
                                                 tipo = d.tipo,
                                             }).ToList();
            return modulos;
        }
        [HttpGet("[action]")]
        public IEnumerable<MonedaViewModel> Moneda()
        {
            List<MonedaViewModel> monedas = (from d in db.Moneda
                                             select new MonedaViewModel
                                             {
                                                 id = d.id,
                                                 nombre = d.nombre,
                                             }).ToList();
            return monedas;
        }
        [HttpGet("[action]")]
        public IEnumerable<ZonaSectorViewModel> ZonaSector()
        {
            List<ZonaSectorViewModel> zonasSectores = (from d in db.ZonaSector
                                             select new ZonaSectorViewModel
                                             {
                                                 id = d.id,
                                                 zona = d.zona,
                                                 sector = d.sector,
                                             }).ToList();
            return zonasSectores;
        }
        [HttpGet("[action]")]
        public IEnumerable<TipoCasoViewModel> TipoCaso()
        {
            List<TipoCasoViewModel> tiposCasos = (from d in db.TipoCaso
                                               select new TipoCasoViewModel
                                               {
                                                   id = d.id,
                                                   tipo = d.tipo,
                                               }).ToList();
            return tiposCasos;
        }
        [HttpGet("[action]")]
        public IEnumerable<PrioridadViewModel> Prioridad()
        {
            List<PrioridadViewModel> prioridades = (from d in db.Prioridad
                                             select new PrioridadViewModel
                                             {
                                                 id = d.id,
                                                 prioridad = d.prioridad,
                                             }).ToList();
            return prioridades;
        }
        [HttpGet("[action]")]
        public IEnumerable<EtapaViewModel> Etapa()
        {
            List<EtapaViewModel> etapas = (from d in db.Etapa
                                                select new EtapaViewModel
                                                {
                                                    id = d.id,
                                                    etapa = d.etapa,
                                                }).ToList();
            return etapas;
        }
        [HttpGet("[action]")]
        public IEnumerable<ProbabilidadViewModel> Probabilidad()
        {
            List<ProbabilidadViewModel> probabilidadess = (from d in db.Probabilidad
                                                           select new ProbabilidadViewModel
                                                           {
                                                               id = d.id,
                                                               porcentaje = d.porcentaje,
                                                           }).ToList();
            return probabilidadess;
        }
        [HttpGet("[action]")]
        public IEnumerable<TipoCotizacionViewModel> TipoCotizacion()
        {
            List<TipoCotizacionViewModel> tiposCotizaciones = (from d in db.TipoCotizacion
                                                  select new TipoCotizacionViewModel
                                                  {
                                                      id = d.id,
                                                      tipo = d.tipo,
                                                  }).ToList();
            return tiposCotizaciones;
        }
        [HttpGet("[action]")]
        public IEnumerable<InflacionViewModel> Inflacion()
        {
            List<InflacionViewModel> inflaciones = (from d in db.Inflacion
                                                          select new InflacionViewModel
                                                          {
                                                              id = d.id,
                                                              porcentaje = d.porcentaje,
                                                          }).ToList();
            return inflaciones;
        }
        [HttpGet("[action]")]
        public IEnumerable<AsesorViewModel> Asesor()
        {
            List<AsesorViewModel> asesores = (from d in db.Asesor
                                                               select new AsesorViewModel
                                                               {
                                                                   id = d.id,
                                                                   cedula = d.cedula,
                                                               }).ToList();
            return asesores;
        }
        [HttpGet("[action]")]
        public IEnumerable<EstadoContactoViewModel> EstadoContacto()
        {
            List<EstadoContactoViewModel> estadosContacto = (from d in db.EstadoContacto
                                              select new EstadoContactoViewModel
                                              {
                                                  id = d.id,
                                                  estado = d.estado,
                                              }).ToList();
            return estadosContacto;
        }
    }
}
