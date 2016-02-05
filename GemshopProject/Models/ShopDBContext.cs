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
        virtual public DbSet<orders> Orders { get; set; }
        virtual public DbSet<ordered_items> Orderd_items { get; set; }
        virtual public DbSet<Wishlist> Wishlist { get; set; }
        virtual public DbSet<slider> Slider { get; set; }





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
 