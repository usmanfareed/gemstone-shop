using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using Microsoft.AspNet.Identity;


namespace GemshopProject
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.GetUserId() != null)
            {
                string Userid = Context.User.Identity.GetUserId();
                FillPage(Userid);
                Session["userid"] = Userid;
            }
            else
            {
                Response.Redirect("loginPage.aspx");
            }
            if (!string.IsNullOrWhiteSpace(Request.QueryString["total_price"]))
            {
                string price = Convert.ToString(Request.QueryString["total_price"]);
                Session["total_price"] = price;
            }
        }
        private void FillPage(string id)
        {
            // get data from the given id

            UserinfoModel db = new UserinfoModel();
            Users user = db.Get_userinfo(id);

            // fill text boxes with the new data

            FullName.Text = user.FullName;
            email.Text = user.Email;
            ContactNum.Text = Convert.ToString(user.Contact);
            Address.Text = user.Address;


        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            OrderModel db = new OrderModel();
            string userid = Convert.ToString(HttpContext.Current.Session["userid"]);
            orders order = new orders();

            order.full_name = FullName.Text;
            order.email = email.Text;
            order.contact_num = Convert.ToInt64(ContactNum.Text);
            order.current_address = Address.Text;
            order.bank_code = Convert.ToInt32(code.Text);
            order.total_price = Convert.ToInt32(HttpContext.Current.Session["total_price"]);
            order.User_ID = userid;

            

            db.save_order(order);
            int order_id = db.get_order(userid);

            PurchaseModel model = new PurchaseModel();
            List<Purchase> purchases = new List<Purchase>();
            purchases = model.get_ordersinCart(userid);

            foreach (Purchase purchase in purchases)
            {
                ordered_items items = new ordered_items();
                items.product_id = purchase.ProductID;
                items.quantity = purchase.Quantity;
                items.ordersID = order_id;

                db.save_order_items(items);
            }
        }
    }
}