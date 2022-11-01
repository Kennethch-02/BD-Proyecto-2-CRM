using Microsoft.AspNetCore.Mvc;
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
    }
}
