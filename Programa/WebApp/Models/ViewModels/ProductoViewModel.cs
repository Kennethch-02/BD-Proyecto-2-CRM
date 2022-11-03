using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models.ViewModels
{
    public class ProductoViewModel
    {
        [Key]
        public string codigo { get; set; }
        public string nombre { get; set; }
        public Int16 activo { get; set; }
        public string descripcion { get; set; }
        public string familia { get; set; }
        public float precioEstandar { get; set; }
    }
}
