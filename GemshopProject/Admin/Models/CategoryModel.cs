using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Models;

namespace GemshopProject.Admin.Models
{
    public class CategoryModel
    {

        public string insert_category(Category category)
        {
            try
            {
                ShopDBContext db = new ShopDBContext();
                db.Categories.Add(category);
                db.SaveChanges();

                return category.Name + "was successfully inserted";
            }
            catch (Exception e)
            {
                ShopDBContext db = new ShopDBContext();

                return "Error" + e;

            }

        }

        public string update_category(int id, Category category)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                //Fetching objects from database
                Category c = db.Categories.Find(id);
                c.Name = category.Name;
          

                db.SaveChanges();
                return c.Name + "was successfully updated";

            }
            catch (Exception e)
            {

                return "Error" + e;
            }

        }

        public string delete_category(int id)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                Category c = db.Categories.Find(id);

                db.Categories.Attach(c);
                db.Categories.Remove(c);
                db.SaveChanges();

                return c.Name + "was successfully deleted";

            }
            catch (Exception e)
            {

                return "Error" + e;

            }

        }


    }
}