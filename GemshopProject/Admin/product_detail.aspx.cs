using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.Services;
using GemshopProject.Admin.Models;
using GemshopProject.Models;


namespace GemshopProject.Admin
{
    public partial class product_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Category> get_category_list()
        {
            
            List<Category> list = new List<Category>();
            using (ShopDBContext db = new ShopDBContext())
            {
                list = db.Categories.ToList(); 
            }
            return list;
        }


        [WebMethod ]
        public static string insert_product(Product context)
        {
            Console.WriteLine(context);
            var product = new Product();
            product.Name = context.Name;
            product.Price = context.Price;
            product.CategoryID = context.CategoryID;
            product.AvailableQuantity =context.AvailableQuantity;
            product.DateAdded = context.DateAdded;
            product.Description = context.Description;
            ProductModel db = new ProductModel();
            db.insert_product(product);
            return "Success";

        }

    }
}