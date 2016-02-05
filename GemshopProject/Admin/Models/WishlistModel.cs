using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Admin.Models;
using GemshopProject.Models;

namespace GemshopProject.Admin.Models
{
    public class WishlistModel
    {

        public string insert_in_wishlist(Wishlist item)
        {
            try
            {
                ShopDBContext db = new ShopDBContext();
                db.Wishlist.Add(item);
                db.SaveChanges();

                return item.ProductID + "was successfully inserted";
            }
            catch (Exception e)
            {
                ShopDBContext db = new ShopDBContext();

                return "Error" + e;

            }

        }


        public string delete_in_wishlist(int id)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                Wishlist w = db.Wishlist.Find(id);

                db.Wishlist.Attach(w);
                db.Wishlist.Remove(w);
                db.SaveChanges();

                return w.ProductID + "was successfully deleted";

            }
            catch (Exception e)
            {

                return "Error" + e;

            }

        }

        public List<Wishlist> get_itmesinWishlist(string userID)
        {
            ShopDBContext db = new ShopDBContext();
            List<Wishlist> items = (from x in db.Wishlist
                                     where x.UsersID == userID
                                     select x).ToList();
            return items;
        }


    }
}