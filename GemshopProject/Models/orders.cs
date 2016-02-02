using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class orders
    {
        public int id { get; set; }
        public string User_ID { get; set; }
        public string full_name { get; set; }
        public string email { get; set; }
        public Int64 contact_num { get; set; }
        public string current_address { get; set; }
        public Int32 total_price { get; set; }
        public Int32 bank_code { get; set; }
        public List<ordered_items> ordered_items  { get; set; }
    }
}