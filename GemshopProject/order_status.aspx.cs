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
    public partial class order_status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Userid = Context.User.Identity.GetUserId();
            Session["Userid"] = Userid;
            if(Userid == null || Userid=="")
            {
                Response.Redirect("loginPage.aspx");
            }
        }


        [WebMethod]
        public static List<orders_data> fill_page()
        {  // this class will fetch all the product data from class to home page
            OrderModel model = new OrderModel();
            string userId = Convert.ToString(HttpContext.Current.Session["Userid"]);
            List<orders> orders = new List<orders>();
            orders = model.get_order_by_id(userId);

            List<orders_data> info = new List<orders_data>();


            foreach (orders order in orders)
            {
                orders_data ordersdata = new orders_data();
                ordersdata.id = order.id;
                ordersdata.Order_Date = order.Order_Date;
                ordersdata.total_price = order.total_price;
                ordersdata.status = order.status;
                info.Add(ordersdata);

            }




            return info;
        }

        public class orders_data
        {
            public int id { get; set; }
            public string Order_Date { get; set; }
            public double total_price { get; set; }
            public string status { get; set; }

        }
    }
}