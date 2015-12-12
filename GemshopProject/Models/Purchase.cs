using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for store_purchases
/// </summary>
/// 
namespace GemshopProject.Models
{
    public class Purchase
    {
        public int ID { get; set; }
        public int Quantity { get; set; }
        public int TotalPrice { get; set; }
        public string DateTime { get; set; }


        virtual public Users Users { get; set; }
        virtual public Product Products { get; set; }
    }
}