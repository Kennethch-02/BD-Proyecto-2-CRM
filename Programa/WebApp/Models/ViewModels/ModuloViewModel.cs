using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class ModuloViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
}
