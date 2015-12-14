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

        protected void createBtn_Click(object sender, EventArgs e)
        {
            string path=null;
            try
            {
                if (import_image.PostedFile.ContentType == "image/jpeg")
                {
                  
                        string filename = Path.GetFileName(import_image.FileName);
                        import_image.SaveAs(Server.MapPath("~/images/") + filename);
                        path = "/images/" + filename;
                        StatusLabel.Text = path;
                        
                   
                }
                else
                {
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }

            ProductModel db = new ProductModel();
            Product p = create_product();
            p.Image = path;
            db.insert_product(p);

        }

        private Product create_product()
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


    }
}