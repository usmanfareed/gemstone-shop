using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using Microsoft.AspNet.Identity;
using System.Web.Services;

namespace GemshopProject
{
    public partial class wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Userid = Context.User.Identity.GetUserId();
            Session["Userid"] = Userid;
            WishlistModel model = new WishlistModel();
            if (Userid != null)
            {
                if (!string.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    Wishlist item = new Wishlist
                    {

                        UsersID = Userid,

                        ProductID = id
                    };
                    model.insert_in_wishlist(item);
                }
                else if (!string.IsNullOrWhiteSpace(Request.QueryString["del"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["del"]);
                    model.delete_in_wishlist(id);
                    Response.Redirect("wishlist.aspx");
                }
            }
            else
            {
                Response.Redirect("loginPage.aspx");
            }

        }



        [WebMethod]
        public static List<wishlist_data> fill_page()
        {  // this class will fetch all the product data from class to home page
            WishlistModel model = new WishlistModel();
            ProductModel productmodel = new ProductModel();
            string userId = Convert.ToString(HttpContext.Current.Session["Userid"]);
            List<Wishlist> items = new List<Wishlist>();
            items = model.get_itmesinWishlist(userId);

            List<wishlist_data> info = new List<wishlist_data>();


            foreach (Wishlist item in items)
            {
                wishlist_data wishlist = new wishlist_data();
                Product product = productmodel.get_product_ef(item.ProductID);
                wishlist.image = product.Image;
                wishlist.Price = product.Price;
                wishlist.name = product.Name;
                wishlist.wishlistid = item.ID;
                info.Add(wishlist);

            }




            return info;
        }

        public class wishlist_data
        {
            public string image { get; set; }
            public string name { get; set; }
            public double Price { get; set; }
            public int wishlistid { get; set; }

        }


    }
}