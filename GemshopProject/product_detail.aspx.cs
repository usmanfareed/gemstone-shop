using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using System.Web.Services;

namespace GemshopProject
{
    public partial class product_detail : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Session["session_id"] = id;
        }


        [WebMethod(EnableSession = true)]
        public static List<Product> get_product()
        {
            product_detail get = new product_detail();
            ProductModel db = new ProductModel();
            //List<Product> product = new List<Product>();
            int id = Convert.ToInt32(HttpContext.Current.Session["session_id"]);
            List<Product> product = db.get_product(id);
            return product;


        }


    }
}