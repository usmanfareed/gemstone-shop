using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using GemshopProject.Admin.Models;
using GemshopProject.Models;
using System.Web.Services;
using System.Collections;

namespace GemshopProject
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Userid = Context.User.Identity.GetUserId();
            Session["Userid"] = Userid;
            PurchaseModel model = new PurchaseModel();
            if (Userid != null)
            {
                
            
            if (!string.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                Purchase cart = new Purchase
                {
                    Quantity = 1,
                    UsersID = Userid,
                    DateTime = Convert.ToString(DateTime.Now),
                    IsInCart = true,
                    ProductID = id
                };
                model.insert_purchase(cart);
            }
            else if (!string.IsNullOrWhiteSpace(Request.QueryString["del"]))
            {
                int id = Convert.ToInt32(Request.QueryString["del"]);
                model.delete_purchase(id);
                Response.Redirect("cart.aspx");
            }


            else if (!string.IsNullOrWhiteSpace(Request.QueryString["pur_id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["pur_id"]);
                int value = Convert.ToInt32(Request.QueryString["quan"]);
                update_quantity(id, value);
            }
            }
            else
            {
                Response.Redirect("loginPage.aspx");
            }

        }

        private void GetPurchasesInCart(string userId)
        {
            PurchaseModel model = new PurchaseModel();
            double subTotal = 0;

            //generate html for each element in the purchaselist
            List<Purchase> purchaselist = model.get_ordersinCart(userId);
            //CreateShopTable(purchaselist, out subTotal);

            //add totals to the page
            double totalAmount = subTotal;

            //display values on page

        }

        //private void CreateShopTable(List<Purchase> purchaselist, out double subTotal)
        //{
        //}


        [WebMethod]
        public static List<cart_data> fill_page()
        {  // this class will fetch all the product data from class to home page
            PurchaseModel model = new PurchaseModel();
            ProductModel productmodel = new ProductModel();
            string userId = Convert.ToString(HttpContext.Current.Session["Userid"]);
            List<Purchase> purchases = new List<Purchase>();
            purchases=model.get_ordersinCart(userId);

            List<cart_data> info = new List<cart_data>();
            
            
            foreach(Purchase purchase in purchases)
            {
                cart_data cart = new cart_data();
                Product product = productmodel.get_product_ef(purchase.ProductID);
                cart.image = product.Image;
                cart.name = product.Name;
                cart.price = product.Price;
                cart.quantity = purchase.Quantity;
                cart.purchaseid = purchase.ID;
                info.Add(cart);
                
            }

           


            return info;
        }

        public class cart_data
        {
            public string image { get; set; }
            public string name { get; set; }

            public int quantity { get; set; }

            public double price { get; set; }
            public int purchaseid { get; set; }

        }
       
        private void update_quantity(int id, int quantity)
        {
            
            //TextBox data = (TextBox)sender;
            //if (data.Text != null)
            //{


                //int[] info = data.Text.Split(',').Select(n => Convert.ToInt32(n)).ToArray();
                //int cartId = Convert.ToInt32(data);
                //int quantity = Convert.ToInt32(info[1]);

                //Update purchase with new quantity and refresh page
                PurchaseModel cartModel = new PurchaseModel();
                cartModel.update_quantity(id, quantity);
                Response.Redirect("cart.aspx");
            //}
        }
    }
}