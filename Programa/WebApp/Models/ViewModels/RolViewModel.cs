using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class RolViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string tipo { get; set; }
    }
}
