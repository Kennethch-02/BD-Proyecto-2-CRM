using System.ComponentModel.DataAnnotations;

namespace WebApp.Controllers.Models.ViewModels
{
    public class CotizacionViewModel
    {
        [Key]
        public string numero { get; set; }
        public string nombreOportunidad { get; set; }
        public string fecha { get; set; }
        public string nombreCuenta { get; set; }
        public string mesAnnoProyectado { get; set; }
        public string asesor { get; set; }
        public string fechaCierre { get; set; }
        public Int16 etapa { get; set; }
        public Int16 moneda { get; set; }
        public Int16 probabilidad { get; set; }
        public string ordenCompra { get; set; }
        public Int16 tipo { get; set; }
        public string descripcion { get; set; }
        public Int16 zonaSector { get; set; }
        public string contacto { get; set; }
        public string numeroFactura { get; set; }
        public Int16 estado { get; set; }
        public Int16 inflacion { get; set; }
    }
}
