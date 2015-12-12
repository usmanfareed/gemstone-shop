using System;
using System.Collections.Generic;
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
        public int ID { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int AvailableQuantity { get; set; }
        public string Description { get; set; }
        public string DateAdded { get; set; }
        public string Image { get; set; }
        public string AddedBy { get; set; }
        public string DateUpdated { get; set; }
        public string UpdatedBy { get; set; }
        virtual public Category Category { get; set; }
        virtual public List<Purchase> purchases { get; set; }

    }
}