using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class EstadoContactoViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string estado { get; set; }
    }
}
