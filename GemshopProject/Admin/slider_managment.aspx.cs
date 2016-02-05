using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Admin.Models;
using GemshopProject.Models;
using System.IO;


namespace GemshopProject.Admin
{
    public partial class slider_managment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_ServerClick(object sender, EventArgs e)
        {
            SliderModel db = new SliderModel();

            string path = null;
            string filename = Path.GetFileName(import_image.FileName);
            import_image.SaveAs(Server.MapPath("~/images/") + filename);
            path = "/images/" + filename;


            slider data = new slider();

            data.Name = name.Text;
            data.ProductID = Convert.ToInt32(DropDownList1.SelectedValue);
            data.image_path = path;
            

            db.insert_slider(data);

            Response.Redirect("slider_managment.aspx");


        }

        protected void SliderGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Get Selected row 
            GridViewRow row = SliderGrid.Rows[e.RowIndex];

            //Get id of selected product
            string img = Convert.ToString(row.Cells[2].Text);

            File.Delete(Server.MapPath(img));
        }
    }
}