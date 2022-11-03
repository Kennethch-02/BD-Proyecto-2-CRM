using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class ProbabilidadViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public Int16 porcentaje { get; set; }
    }
}
