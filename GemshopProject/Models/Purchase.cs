﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        [Key]
        public int ID { get; set; }
        public string UsersID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public string DateTime { get; set; }

        public Users Users { get; set; }
        public Product Products { get; set; }

    }
}