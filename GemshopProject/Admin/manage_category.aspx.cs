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

        protected void CategoriesGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton del = e.Row.Cells[3].Controls[2] as LinkButton;
                del.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this event?');");
            }
        }
    }
}