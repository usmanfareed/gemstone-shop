using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class Wishlist
    {
        [Key]
        public int ID { get; set; }
        public string UsersID { get; set; }
        public int ProductID { get; set; }

        public Users Users { get; set; }
        public Product Products { get; set; }
    }
}