using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using System.Web.Services;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;

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

    protected void login_btn_Click(object sender, EventArgs e)
    {
        UserStore<IdentityUser> userstore = new UserStore<IdentityUser>();
        userstore.Context.Database.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.
            ConnectionStrings["ShopDBContext"].ConnectionString;

        UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userstore);

        var user = manager.Find(UserName.Text, pass.Text);
        if (user != null)
        {
            //call owin functionality
            var authmanager = HttpContext.Current.GetOwinContext().Authentication;
            var useridentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

            //sign in user
            authmanager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties
            {
                IsPersistent = false

            },useridentity);

            //redirect user to homepage
            Response.Redirect("~/Home.aspx");
        }
        else
        {
            litStatus.Text = "<font style='color : red;'>Invalid Username or Password</font>";
        }
    }
}