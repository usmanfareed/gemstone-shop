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

        public List<orders> get_order_by_id(string userid)
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    List<orders> order = (from x in db.Orders
                                          where x.User_ID == userid

                                          select x).ToList();
                    return order;
                    //Product product = db.Products.Find(id);
                    //return product;
                }
            }
            catch (Exception)
            {

                return null;
            }




        }


        public string update_userinfo(int id, orders order)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                //Fetching objects from database
                orders o = db.Orders.Find(id);

                o.full_name = order.full_name;
                o.email = order.email;
                o.contact_num = order.contact_num;
                o.current_address = order.current_address;

                

                db.SaveChanges();
                return order.full_name + "was successfully updated";

            }
            catch (Exception e)
            {

                return "Error" + e;
            }

        }



        public orders Get_order_userinfo(int id)
        {
            ShopDBContext db = new ShopDBContext();
            orders info = (from x in db.Orders
                          where x.id == id
                          select x).FirstOrDefault();
            return info;
        }

    }
}