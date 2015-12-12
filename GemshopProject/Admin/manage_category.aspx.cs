using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using GemshopProject.Admin.Models;
using GemshopProject.Models;


namespace GemshopProject.Admin
{
    public partial class manage_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string insert_category(Category context)
        {

            var category = new Category();
            category.Name = context.Name;
            category.Description = context.Description;
            CategoryModel db = new CategoryModel();
            db.insert_category(category);
            return "Success";

        }
    }
}