using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using System.Web.Services;

public partial class loginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //[WebMethod]
    //public static string login_user(string Email,string Password)
    //{
    //    ShopDBContext db = new ShopDBContext();
    //    //var data = new Users();
    //    //var data = db.Users.Find(id);

    //    var data = from login_data in db.Users
    //               where login_data.Email == Email
    //               where login_data.Password == Password
    //               select login_data;
   

    //    return view(data.ToList());
    //    //}
    //    //else
    //    //{
    //    //    return "no user";
    //    //}
    //}
}