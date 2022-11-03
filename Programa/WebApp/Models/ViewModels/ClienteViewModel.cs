using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models.ViewModels
{
    public class ClienteViewModel
    {
        [Key]
        public string nombreDeUsuario { get; set; }
        public string correoElectronico { get; set; }
        public string contactoPrincipal { get; set; }
        public Int16 moneda { get; set; }
        public string telefono { get; set; }
        public string celular { get; set; }
        public string sitioWeb { get; set; }
        public string infoAdicional { get; set; }
        public string asesor { get; set; }
        public Int16 zonaSector { get; set; }
    }
}
