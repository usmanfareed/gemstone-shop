using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users
/// </summary>
namespace GemshopProject.Models
{ 
public class Users
{
    public int ID { get; set; }
    public string AuthID { get; set; }
    public string FullName { get; set; }
    public string Email { get; set; }

    public int Contact { get; set; }

    public string Address { get; set; }
    public string reg_Date { get; set; }


     public List<Purchase> purchases { get; set; }
    }
}