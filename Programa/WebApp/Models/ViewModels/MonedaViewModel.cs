using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class MonedaViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string nombre { get; set; }
    }
}
