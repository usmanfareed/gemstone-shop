using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users_groups_permissions
/// </summary>
/// 
namespace GemshopProject.Models
{
    public class Users_groups_permissions
    {
        public int ID { get; set; }
        public int Permission { get; set; }
        public Users_groups User_groups { get; set; }
    }
}