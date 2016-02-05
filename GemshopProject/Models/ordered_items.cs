using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class ordered_items
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public int ordersID { get; set; }
        [Required]
        public int product_id { get; set; }
        [Required]
    
        public int quantity { get; set; }
        public orders orders { get; set; }
    }
}