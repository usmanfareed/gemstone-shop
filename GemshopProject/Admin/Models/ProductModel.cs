using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Models;
using System.IO;
using System.Drawing;

namespace GemshopProject.Admin.Models
{
    public class ProductModel
    {

        public string insert_product(Product product)
        {
            try
            {
                ShopDBContext db = new ShopDBContext();
                db.Products.Add(product);
                db.SaveChanges();

                return product.Name + "was successfully inserted";
            }
            catch (Exception e)
            {
                ShopDBContext db = new ShopDBContext();

                return "Error" + e;

            }

        }

        public string update_product(int id, Product product)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                //Fetching objects from database
                Product p = db.Products.Find(id);

                p.Name = product.Name;
                p.Price = product.Price;
                p.Description = product.Description;
                p.CategoryID = product.CategoryID;
                p.DateUpdated = product.DateUpdated;

                if (product.Image != null)
                {
                    p.Image = product.Image;
                }

                db.SaveChanges();
                return product.Name + "was successfully updated";

            }
            catch (Exception e)
            {

                return "Error" + e;
            }

        }

        public string delete_product(int id)
        {


            try
            {
                ShopDBContext db = new ShopDBContext();
                Product p = db.Products.Find(id);

                db.Products.Attach(p);
                db.Products.Remove(p);
                db.SaveChanges();

                return p.Name + "was successfully deleted";

            }
            catch (Exception e)
            {

                return "Error" + e;

            }

        }


        public List<Product> get_product(int id)
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    List<Product> products = (from x in db.Products
                                              where x.ID == id
                                              select x).ToList();
                    return products;
                    //Product product = db.Products.Find(id);
                    //return product;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }

        public Product get_product_ef(int id)
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {

                    Product product = db.Products.Find(id);
                    return product;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }

        public List<Product> get_all_products()
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    List<Product> products = (from x in db.Products
                                              select x).ToList();
                    return products;
                }
            }
            catch (Exception)
            {

                return null;
            }

        }

        public List<Product> get_product_by_category(int catID)
        {
            using (ShopDBContext db = new ShopDBContext())
            {
                List<Product> products = (from x in db.Products
                                          where x.CategoryID == catID
                                          select x).ToList();
                return products;
            }
        }


        public List<Product> search_products(string search)
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    List<Product> products = (from x in db.Products
                                              where x.Name.Contains(search)
                                              select x).ToList();
                    return products;
                    //Product product = db.Products.Find(id);
                    //return product;
                }
            }
            catch (Exception)
            {

                return null;
            }

        }

    }
}








//public byte[] imageToByteArray(System.Drawing.Image imageIn)
//{
//    MemoryStream ms = new MemoryStream();
//    imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
//    return ms.ToArray();
//}

//public Image byteArrayToImage(byte[] byteArrayIn)
//{
//    MemoryStream ms = new MemoryStream(byteArrayIn);
//    Image returnImage = Image.FromStream(ms);
//    return returnImage;
//}