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
                p.Image = product.Image;
                p.CategoryID = product.CategoryID;

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


        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();
        }

        public Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }

    }

}