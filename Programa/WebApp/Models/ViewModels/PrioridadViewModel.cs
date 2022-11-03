using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class PrioridadViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string prioridad { get; set; }
    }
}
