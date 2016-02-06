using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GemshopProject.Models
{
    public class orders
    {
        [Key]
        public int id { get; set; }
        public string User_ID { get; set; }
        [Required]

        public string full_name { get; set; }
        [Required]

        public string email { get; set; }
        [Required]

        public Int64 contact_num { get; set; }
        [Required]

        public string current_address { get; set; }

        public Int32 total_price { get; set; }
        public string Order_Date { get; set; }
        
        public string status { get; set; }
        public Int64 bank_code { get; set; }
        public string transection_date_time { get; set; }
        public List<ordered_items> ordered_items  { get; set; }
    }
}