using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Models;


namespace GemshopProject.Admin.Models
{
    public class PurchaseModel
    {
        public string insert_purchase(Purchase purchase)
        {
            try
            {
                ShopDBContext db = new ShopDBContext();
                db.Purchases.Add(purchase);
                db.SaveChanges();

                return purchase.DateTime + "was successfully inserted";
            }
            catch (Exception e)
            {
                ShopDBContext db = new ShopDBContext();

                return "Error" + e;

            }

        }

        public string update_purchase(int id, Purchase purchase)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                //Fetching objects from database
                Purchase p = db.Purchases.Find(id);
                p.DateTime = purchase.DateTime;
                p.Users.ID = purchase.Users.ID;
                p.Products.ID = purchase.Products.ID;
                p.Quantity = purchase.Quantity;
                p.TotalPrice = purchase.TotalPrice;

                

                db.SaveChanges();
                return purchase.DateTime + "was successfully updated";

            }
            catch (Exception e)
            {

                return "Error" + e;
            }

        }

        public string delete_purchase(int id)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                Purchase p = db.Purchases.Find(id);

                db.Purchases.Attach(p);
                db.Purchases.Remove(p);
                db.SaveChanges();

                return p.DateTime + "was successfully deleted";

            }
            catch (Exception e)
            {

                return "Error" + e;

            }

        }
    }
}