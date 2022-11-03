using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class AsesorViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string cedula { get; set; }
    }
}
