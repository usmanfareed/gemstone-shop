using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GemshopProject.Admin
{
    public partial class all_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ProductsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Get Selected row 
            GridViewRow row = ProductsGrid.Rows[e.NewEditIndex];

            //Get id of selected product
            int rowId = Convert.ToInt32(row.Cells[0].Text);

            //Redirect user to all products with the selected rowId
            Response.Redirect("~/Admin/product_detail.aspx?id=" + rowId);
        }

        protected void ProductsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
         

            //Get Selected row 
            GridViewRow row = ProductsGrid.Rows[e.RowIndex];

            //Get id of selected product
            string img = Convert.ToString(row.Cells[5].Text);

            File.Delete(Server.MapPath(img));



        }
    }
}