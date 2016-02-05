using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class slider
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]

        public string image_path { get; set; }
        [Required]

        public int ProductID { get; set; }
        public Product Products { get; set; }

    }
}