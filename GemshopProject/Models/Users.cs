using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users
/// </summary>
namespace GemshopProject.Models
{ 
public class Users
{
        [Key]
        public int ID { get; set; }
    public string AuthID { get; set; }
        [Required]

    public string FullName { get; set; }
        [Required]

        public string Email { get; set; }
        [Required]


        public long Contact { get; set; }
        [Required]

    public string Address { get; set; }
    public string reg_Date { get; set; }


     public List<Purchase> purchases { get; set; }
        public List<Wishlist> wishlist { get; set; }
    }
}