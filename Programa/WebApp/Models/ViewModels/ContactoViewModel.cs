using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models.ViewModels
{
    public class ContactoViewModel
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
}
