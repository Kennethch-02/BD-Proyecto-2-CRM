using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models.ViewModels
{
    public class UserViewModel
    {
        [Key]
        public string cedula { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string departamento { get; set; }
        public string clave { get; set; }
        public string rol { get; set; }
    }
}
