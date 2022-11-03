using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class EtapaViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string etapa { get; set; }
    }
}
