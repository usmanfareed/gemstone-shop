using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using System.Web.Services;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<Product> fill_page()
    {  // this class will fetch all the product data from class to home page
        ProductModel productmodel = new ProductModel();
        List<Product> products = new List<Product>();
        products = productmodel.get_all_products();

 

        return products;
        
    }

    

    }
















//public string fill_page ()
//{
//    //get list of products from db
//    ProductModel productmodel = new ProductModel();
//    List<Product> products = productmodel.get_all_products();

//    //check if products exist in the database
//    if (products!= null)
//    {
//        return products.ToList;

//        // creating panal for image button and 2 labels
//        //foreach(Product product in products)
//        //{
//            //Panel productpanel = new Panel();
//            //ImageButton imagebutton = new ImageButton();
//            //Label nameLabel = new Label();
//            //Label priceLabel = new Label();

//            ////set values
//            //imagebutton.ImageUrl = "~" + product.Image;
//            //imagebutton.PostBackUrl = "~/product_detail.aspx?id="+product.ID;
//            //imagebutton.CssClass = "prev";

//            //nameLabel.Text = product.Name;
//            //nameLabel.CssClass = "title";

//            //priceLabel.Text = "Rs " + product.Price;
//            //priceLabel.CssClass = "price";

//            ////add child controls to panel
//            //productpanel.Controls.Add(imagebutton);
//            //productpanel.Controls.Add(new Literal { Text = "<br />" });
//            //productpanel.Controls.Add(nameLabel);
//            //productpanel.Controls.Add(new Literal { Text = "<br />" });
//            //productpanel.Controls.Add(priceLabel);

//            ////add dynamic panels to static parent panel
//            //pnlProducts.Controls.Add(productpanel);
//            //pnlProducts.CssClass = "products featured-products";

//        //}

//        }
//    else
//    {
//        return "No Products found";
//    }

//}
