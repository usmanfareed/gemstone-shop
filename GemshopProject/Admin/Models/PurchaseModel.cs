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



                db.SaveChanges();
                return purchase.DateTime + "was successfully updated";

            }
            catch (Exception e)
            {

                return "Error" + e;
            }

        }

        public string delete_purchase_by_userid(string userid)
        {

            ShopDBContext db = new ShopDBContext();
            var items = (from x in db.Purchases
                         where x.UsersID == userid

                         select x);
            foreach (var item in items)
            {
                db.Purchases.Attach(item);
                db.Purchases.Remove(item);
                
            }
            db.SaveChanges();
            return "success";
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

    public List<Purchase> get_ordersinCart(string userID)
    {
        ShopDBContext db = new ShopDBContext();
        List<Purchase> orders = (from x in db.Purchases
                                 where x.UsersID == userID
                                 orderby x.DateTime
                                 select x).ToList();
        return orders;
    }
    //public int get_amountofOrders(string userID)
    //{
    //    try
    //    {
    //        ShopDBContext db = new ShopDBContext();
    //        int totalprice = (from x in db.Purchases
    //                          where x.UsersID == userID
    //                          && x.IsInCart
    //                          select x.TotalPrice).Sum();
    //        return totalprice;
    //    }
    //    catch  
    //    {

    //        return 0;
    //    }
    //}
    public void update_quantity(int id, int quantity)
    {
        ShopDBContext db = new ShopDBContext();
        Purchase purchase = db.Purchases.Find(id);
        purchase.Quantity = quantity;

        db.SaveChanges();

    }

    public void mark_paid(List<Purchase> purchases)
    {
        ShopDBContext db = new ShopDBContext();
        if (purchases != null)
        {
            foreach (Purchase purchase in purchases)
            {
                Purchase oldpurchase = db.Purchases.Find(purchase.ID);
                oldpurchase.DateTime = DateTime.Now.ToString();
            }
            db.SaveChanges();
        }
    }
}
}
