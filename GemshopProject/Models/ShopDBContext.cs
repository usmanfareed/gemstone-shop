using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
/// <summary>
/// Summary description for ShopDBContext
/// </summary>
namespace GemshopProject.Models
{
    public class ShopDBContext : DbContext

    {
        public ShopDBContext() : base("GemshopDatabase")
        {

        }
        virtual public DbSet<Users> Users { get; set; }
        virtual public DbSet<Product> Products { get; set; }

        virtual public DbSet<Category> Categories { get; set; }

        virtual public DbSet<Purchase> Purchases { get; set; }

        virtual public DbSet<Users_groups> Users_groups { get; set; }

        virtual public DbSet<Users_groups_permissions> Users_groups_permissions { get; set; }

      

    }


    //public class add_data
    //{
    //    static void main(string[] args)
    //    {
    //        using (var db = new ShopDBContext())
    //        {
    //            var user = new Users() { FullName = "Usman" };
    //            db.Users.Add(user);
    //            db.SaveChanges();
    //        }
    //    }
    //}
}
 