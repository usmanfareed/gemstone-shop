using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using GemshopProject.Admin.Models;
using System.Web.Services;

public partial class looseGemstones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(Request.QueryString["cat_id"]))
        {
            string cat_id = Request.QueryString["cat_id"];
            Session["cat_id"] = cat_id;

            int catid = Convert.ToInt32(cat_id);
            CategoryModel categorymodel = new CategoryModel();
            Category get_by_catid = categorymodel.get_category_by_id(catid);
            if (catid == get_by_catid.ID)
            {
                heading.InnerText = get_by_catid.Name;
            }
        }
        else
        {
            int cat_id = 0;
            Session["cat_id"] = cat_id;
        }
        if (!string.IsNullOrWhiteSpace(Request.QueryString["search"]))
                     {
                          string search = Request.QueryString["search"];
                         Session["search"] = search;
                      }
    }
    [WebMethod]
    public static List<Category> fill_page()
    {  // this class will fetch all the Category data from class to home page

        int cat_id = Convert.ToInt32(HttpContext.Current.Session["cat_id"]);

        CategoryModel categorymodel = new CategoryModel();
            List<Category> categories = new List<Category>();
            categories = categorymodel.get_all_categories();
            return categories;


         

 
    }

    [WebMethod]
    public static List<Product> get_products()
    {  // this class will fetch all the product data from class to home page
        string search = Convert.ToString(HttpContext.Current.Session["search"]);
        int cat_id = Convert.ToInt32(HttpContext.Current.Session["cat_id"]);
        if (cat_id == 0 && search == null)
        {
            ProductModel productmodel = new ProductModel();
            List<Product> products = new List<Product>();
            products = productmodel.get_all_products();

            return products;

        }
        else if (cat_id != 0)
            {
                ProductModel productmodel = new ProductModel();
                List<Product> products = new List<Product>();
                products = productmodel.get_product_by_category(cat_id);
               

                return products;
            }
            else if (search != null)
                {
                ProductModel productmodel = new ProductModel();
                              List<Product> products = new List<Product>();
                              products = productmodel.search_products(search);
                          
              return products;
            }
        return null;
        }
    }

