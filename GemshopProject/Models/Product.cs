using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for store_products
/// </summary>
/// 
namespace GemshopProject.Models
{
    public class Product
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }

        public double Price { get; set; }
       
        public int AvailableQuantity { get; set; }
        public string Description { get; set; }
        public string DateAdded { get; set; }

        public string Image { get; set; }
        public string DateUpdated { get; set; }
        public int CategoryID { get; set; }
        public Category Category { get; set; }
        public List<Purchase> purchases { get; set; }
        public List<Wishlist> wishlist { get; set; }
        public List<slider> slider { get; set; }


    }
}