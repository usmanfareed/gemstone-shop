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
using System.Windows.Forms;

namespace GemshopProject
{
    public partial class cart : System.Web.UI.Page
    {
        int available_quantity;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Userid = Context.User.Identity.GetUserId();
            Session["Userid"] = Userid;
            PurchaseModel model = new PurchaseModel();
            ProductModel productmodel = new ProductModel();
            if (Userid != null)
            {
                
            
            if (!string.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                    int value = 1;
                    int quan =0;
                    if(!string.IsNullOrWhiteSpace(Request.QueryString["quan"]))
                    {
                        value = Convert.ToInt32(Request.QueryString["quan"]);
                    }

                    if (!string.IsNullOrWhiteSpace(Request.QueryString["quantity"]))
                    {
                        quan = Convert.ToInt32(Request.QueryString["quantity"]);
                    }

                    Purchase cart = new Purchase
                {
                    Quantity = value,
                    UsersID = Userid,
                    DateTime = Convert.ToString(DateTime.Now),
                    ProductID = id
                };
                    int purchaseid = model.check_order_product(Userid, id);
                    int purchasequantity = model.check_order_quantity(Userid, id);
                    int purchaseproductid = model.check_order_productid(Userid, id);
                    available_quantity = productmodel.available_quantity_product(id);


                    //Session["avail_quantity"] = available_quantity;

                    if (purchaseid == 0)
                    {
                        model.insert_purchase(cart);
                    }
                    
                    else if (quan != 0)
                    {
                        if (quan > available_quantity)
                        {
                            MessageBox.Show("Quantity selected is more than Available Quantity");
                        }
                        else
                        { 
                        update_quantity(purchaseid, quan);
                         }
                    }

                    else if (purchasequantity == available_quantity)
                    {
                        MessageBox.Show("Product Quantity is already equal to Available Quantity");
                    }
                    else
                    {
                        update_quantity(purchaseid, purchasequantity+1);
                    }
            }
            else if (!string.IsNullOrWhiteSpace(Request.QueryString["del"]))
            {
                int id = Convert.ToInt32(Request.QueryString["del"]);
                model.delete_purchase(id);
                Response.Redirect("cart.aspx");
            }


            //else if (!string.IsNullOrWhiteSpace(Request.QueryString["pur_id"]))
            //{
            //    int id = Convert.ToInt32(Request.QueryString["pur_id"]);
            //    int value = Convert.ToInt32(Request.QueryString["quan"]);
            //    string userId = Convert.ToString(HttpContext.Current.Session["Userid"]);
            //    if (value > available_quantity)
            //        {
            //            System.Windows.Forms.MessageBox.Show("Quantity selected is more than Available Quantity");
            //        }
            //        else
            //        {

            //        }
                    
            //}
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
                cart.avail_quantity = product.AvailableQuantity;
                cart.quantity = purchase.Quantity;
                cart.purchaseid = product.ID ;
                info.Add(cart);
                
            }

           


            return info;
        }

        public class cart_data
        {
            public string image { get; set; }
            public string name { get; set; }

            public int quantity { get; set; }
            public int avail_quantity { get; set; }

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