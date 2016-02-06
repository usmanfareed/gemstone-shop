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
            if (!IsPostBack)
            {
                //Check if url contains id parameter 
                if (!String.IsNullOrWhiteSpace(Request.QueryString["customerid"]))
                {
                    // if id exists update current row
                    int id = Convert.ToInt32(Request.QueryString["customerid"]);
                    Session["customerid"] = id;

                    getdata(id);
                }
            }

            if (Context.User.Identity.GetUserId() != null && HttpContext.Current.Session["customerid"] == null)
            {
                string Userid = Context.User.Identity.GetUserId();
                FillPage(Userid);
                Session["userid"] = Userid;
            }
            else if (Context.User.Identity.GetUserId() == null && HttpContext.Current.Session["customerid"] == null)
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
            address.Text = user.Address;


        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(HttpContext.Current.Session["customerid"]);
            if (customerid != 0)
            {
                OrderModel db = new OrderModel();

                orders order = new orders();

                order.full_name = FullName.Text;
                order.email = email.Text;
                order.contact_num = Convert.ToInt64(ContactNum.Text);
                order.current_address = address.Text;

                db.update_userinfo(customerid, order);


            }
            else {

                if (validation())
                {



                    OrderModel db = new OrderModel();
                    string userid = Convert.ToString(HttpContext.Current.Session["userid"]);
                    orders order = new orders();
                    DateTime date_added = DateTime.Now;
                    order.full_name = FullName.Text;
                    order.email = email.Text;
                    order.contact_num = Convert.ToInt64(ContactNum.Text);
                    order.current_address = address.Text;
                    order.bank_code = Convert.ToInt64(code.Text);
                    order.transection_date_time = datetime.Text;
                    order.total_price = Convert.ToInt32(HttpContext.Current.Session["total_price"]);
                    order.User_ID = userid;
                    order.Order_Date = Convert.ToString(date_added);
                    order.status = "Pending";
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

                    model.delete_purchase_by_userid(userid);
                    Response.Redirect("order_success.aspx");


                }

            }
        }



        private void getdata(int id)
        {
            accountinfo.Visible = false;
            createBtn.Text = "Save";
            bankdiv.Visible = false;

            // get data from the given id
            OrderModel db = new OrderModel();
            orders user = db.Get_order_userinfo(id);

            // fill text boxes with the new data

            FullName.Text = user.full_name;
            email.Text = user.email;
            ContactNum.Text = Convert.ToString(user.contact_num);
            address.Text = user.current_address;


        }

        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }


        private bool validation()
        {

            int n;
            double d;
            if ((FullName.Text == "") || int.TryParse(FullName.Text, out n))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Full Name field is empty or invalid </font>");
                return false;
            }
            else if ((ContactNum.Text == "") || !(double.TryParse(ContactNum.Text, out d)))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Contact Number field is empty or invalid </font>");
                return false;
            }
            else if (((code.Text == "") || !(int.TryParse(code.Text, out n)))  || (datetime.Text == ""))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Bank Transection Code / Transection Date and Time field is empty or invalid</font>");
                return false;
            }
            else if ((address.Text == ""))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Address field is empty </font>");
                return false;
            }
            else if ((email.Text == "") || !(IsValidEmail(email.Text)))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Email field is empty or invalid </font>");
                return false;
            }
            else
            {
                return true;
            }
        }



    }

    
}