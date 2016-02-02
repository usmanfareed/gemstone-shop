using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Models;

namespace GemshopProject.Admin.Models
{
    public class OrderModel
    {
        public void save_order(orders order)
        {
            ShopDBContext db = new ShopDBContext();
            db.Orders.Add(order);
            db.SaveChanges();
        }


        public int get_order(string userid)
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    int order = (from x in db.Orders
                                              where x.User_ID == userid
                                 orderby x.id descending
                                 select x.id).FirstOrDefault(); 
                    return order;
                    //Product product = db.Products.Find(id);
                    //return product;
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }
        public void save_order_items(ordered_items items)
        {
            ShopDBContext db = new ShopDBContext();
            db.Orderd_items.Add(items);
            db.SaveChanges();
        }




    }

}