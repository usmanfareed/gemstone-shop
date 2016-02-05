using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using System.Web.Services;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SliderModel slidermodel = new SliderModel();
        List<slider> banners = new List<slider>();
        banners = slidermodel.get_all_banners();

        DataTable newsDataTable = new DataTable();

        // add some columns to our datatable
        newsDataTable.Columns.Add("href_li");
        newsDataTable.Columns.Add("img_li");
        foreach(slider banner in banners)
        {
            DataRow newsDataRow = newsDataTable.NewRow();
            newsDataRow["href_li"] = "product_detail.aspx?id="+banner.ProductID;
            newsDataRow["img_li"] = banner.image_path;
            newsDataTable.Rows.Add(newsDataRow);

            repeat.DataSource = newsDataTable;
            repeat.DataBind();
        }
        

        //slider.InnerHtml = "<li id='slide'> < div class='slid_content'> <a class='buy_now' href='#'>Buy now</a> </div><img src = '/images/slid-2.png' alt= 'Slid 2' title= '' > </ li > "+ slider.InnerText; 
    }

    [WebMethod]
    public static List<Product> fill_page()
    {  // this class will fetch all the product data from class to home page
        ProductModel productmodel = new ProductModel();
        List<Product> products = new List<Product>();
        products = productmodel.get_all_products();

 

        return products;
        
    }

    //[WebMethod]
    //public static List<slider> fill_slider()
    //{  // this class will fetch all the product data from class to home page
    //    SliderModel slidermodel = new SliderModel();
    //    List<slider> products = new List<slider>();
    //    products = slidermodel.get_all_banners();



    //    return products;

    //}


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
