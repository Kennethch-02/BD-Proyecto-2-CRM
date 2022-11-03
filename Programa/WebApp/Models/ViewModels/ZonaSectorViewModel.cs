using System.ComponentModel.DataAnnotations;

namespace WebApp.Models.ViewModels
{
    public class ZonaSectorViewModel
    {
        [Key]
        public Int16 id { get; set; }
        public string zona { get; set; }
        public string sector { get; set; }
    }
}
