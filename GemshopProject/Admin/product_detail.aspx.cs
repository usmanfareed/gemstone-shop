using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.Services;
using GemshopProject.Admin.Models;
using GemshopProject.Models;
using System.Windows.Forms;
using System.IO;


namespace GemshopProject.Admin
{

    public partial class product_detail : System.Web.UI.Page
    {
        string path = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //Check if url contains id parameter 
                if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    // if id exists update current row
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    FillPage(id);
                }
            }


        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            ProductModel db = new ProductModel();
            // this is will upload and save image to server
            
            try
            {
                
                    string filename = Path.GetFileName(import_image.FileName);
                    import_image.SaveAs(Server.MapPath("~/images/") + filename);
                    path = "/images/" + filename;
                    StatusLabel.Text = path;


                
            }
            catch (Exception ex)
            {
                
            }

            Product p = create_product();
            if(p != null)
            { 
            //Check if url contains id parameter 
            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                // if id exists update current row
                DateTime date_added = DateTime.Now;
                if (p != null)
                { int id = Convert.ToInt32(Request.QueryString["id"]);
                    p.DateUpdated = Convert.ToString(date_added);

                    p.Image = path;
                    db.update_product(id, p);
                        Response.Redirect("all_product.aspx");
                    }
                
            }
            //if id donsnt exit create new row
            else
            {
                if ((p != null))
                {

                    p.Image = path;
                db.insert_product(p);


                    Response.Redirect("all_product.aspx");
                }
                else
                {
                    litStatus.Text = String.Format("<font style='color : red;'> Please Complete All the Fields </font>");
                }
            }
            }
        }


        private void FillPage(int id)
        {
            // get data from the given id
             
            ProductModel db = new ProductModel();
            Product product = db.get_product_ef(id);

            // fill text boxes with the new data

            product_name.Text = product.Name;
            product_price.Text = Convert.ToString(product.Price);
            product_quantity.Text = Convert.ToString(product.AvailableQuantity);
            product_description.Text = product.Description;
            Session["img_path"] = product.Image;
            // set dropdown values
            droplist.SelectedValue = Convert.ToString(product.CategoryID);
        }


        private Product create_product()
        {
            if (validation() )
            {
                DateTime date_added = DateTime.Now;
                var product = new Product();
                product.Name = product_name.Text;
                product.Price = Convert.ToInt32(product_price.Text);
                product.CategoryID = Convert.ToInt32(droplist.Text);
                product.AvailableQuantity = Convert.ToInt32(product_quantity.Text);
                product.DateAdded = Convert.ToString(date_added);
                product.Description = product_description.Text;
                return product;
            }

            else
            {
                return null ;
            }


        }


        private bool validation()
        {
            string img_path = Convert.ToString(HttpContext.Current.Session["img_path"]);
            int n;
            if ((product_name.Text == "") || int.TryParse(product_name.Text, out n))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Poduct Name field is empty or invalid </font>");
                return false;
            }
            else if ((product_price.Text == "") || !(int.TryParse(product_price.Text, out n)))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Product Price field is empty or invalid </font>");
                return false;
            }

            else if ((product_quantity.Text == "") || !(int.TryParse(product_quantity.Text, out n)))
            {
                litStatus.Text = String.Format("<font style='color : red;'> Product Quantity field is empty or invalid </font>");
                return false;
            }
            else if (product_description.Text == "")
            {
                litStatus.Text = String.Format("<font style='color : red;'> Product Description field is empty </font>");
                return false;
            }

            else if ((path== "" || path == null) && img_path == "")
            {
                litStatus.Text = String.Format("<font style='color : red;'> Please Select Image </font>");
                img_path = "";
                return false;
            }
            else
            {
                return true;
            }
        }







    }
}






//[WebMethod]
//public static List<Category> get_category_list()
//{

//    List<Category> list = new List<Category>();
//    using (ShopDBContext db = new ShopDBContext())
//    {
//        list = db.Categories.ToList(); 
//    }
//    return list;
//}


//[WebMethod ]
//public string insert_product(Product context)
//{

//    string filename = Path.GetFileName(import_image.FileName);
//    import_image.SaveAs(Server.MapPath("~/images/") + filename);
//    string path = "/images/" + filename;
//    StatusLabel.Text = path;
//    var product = new Product();
//    product.Name = context.Name;
//    product.Price = context.Price;
//    product.CategoryID = context.CategoryID;
//    product.AvailableQuantity =context.AvailableQuantity;
//    product.DateAdded = context.DateAdded;
//    product.Description = context.Description;
//    product.Image =context.Image;
//    ProductModel db = new ProductModel();
//    db.insert_product(product);
//    return "Success";

//}


//public void uploadBtn_Click(object sender, EventArgs e)
//{

//    if (!IsPostBack)
//    {
//        Thread newThread = new Thread(new ThreadStart(ThreadMethod));
//        newThread.SetApartmentState(ApartmentState.STA);
//        newThread.Start();
//    }
//}

//static void ThreadMethod()

//{

//        OpenFileDialog img = new OpenFileDialog();
//        img.Title = "Please select a photo";
//        img.Filter = "JPG|*.JPG|PNG|*.png|GIF|*gif";
//        img.Multiselect = false;
//        img.ShowDialog();
//    }
