using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class ordered_items
    {
        public int ID { get; set; }
        public int ordersID { get; set; }
        public int product_id { get; set; }
        public int quantity { get; set; }
        public orders orders { get; set; }
    }
}