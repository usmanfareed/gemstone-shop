using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users_groups
/// </summary>
/// 
namespace GemshopProject.Models
{
    public class Users_groups
    {
        public int ID { get; set; }
        public int Name { get; set; }
        public int Description { get; set; }
         public List<Users> Users { get; set; }
         public List<Users_groups_permissions> Users_groups_permissions { get; set; }
    }
}