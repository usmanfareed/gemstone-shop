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
using Microsoft.Owin.Security;
using GemshopProject.Admin.Models;

[System.Web.Script.Services.ScriptService]

public partial class registrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //[WebMethod]
    //public static string create_user(Users context)
    //{

    //    var user = new Users();
    //    user.FullName = context.FullName;
    //    user.UserName = context.UserName;
    //    user.Password = context.Password;
    //    user.Email = context.Email;
    //    user.Contact = context.Contact;
    //    user.Address = context.Address;
    //    Account_db account_db = new Account_db();
    //    account_db.create_user(user);
    //    return "Success";

    //}

    protected void createBtn_Click(object sender, EventArgs e)
    {
        UserStore<IdentityUser> userstore = new UserStore<IdentityUser>();
        userstore.Context.Database.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.
            ConnectionStrings["ShopDBContext"].ConnectionString;

        UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userstore);

        //creating new user and storing in database
        IdentityUser user = new IdentityUser();
        user.UserName = UserName.Text;
        if (!string.IsNullOrWhiteSpace(FullName.Text) && !string.IsNullOrWhiteSpace(email.Text) && !string.IsNullOrWhiteSpace(ContactNum.Text) && !string.IsNullOrWhiteSpace(Address.Text))
        {
            

        if (password.Text == pass_confirm.Text)
        {
            try
            {
                //create user object
                //database will be created

                IdentityResult result = manager.Create(user, password.Text);
                if (result.Succeeded)
                {
                    Users info = new Users
                    {
                        FullName = FullName.Text,
                        Email = email.Text,
                        Contact = Convert.ToInt64(ContactNum.Text),
                        Address = Address.Text,
                        AuthID = user.Id,
                        reg_Date = Convert.ToString(DateTime.Today)
                    };

                    UserinfoModel model = new UserinfoModel();
                    model.Insert_userinfo(info);

                    //store user in DB
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                    //set to login new user by cookie
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                    //login to the new user and redirect to the homepage
                    authenticationManager.SignIn(new AuthenticationProperties(), userIdentity);
                    Response.Redirect("~/Home.aspx");

                }
                else
                {
                    litStatus.Text =String.Format( "<font style='color : red;'> {0} </font>" , result.Errors.FirstOrDefault());
                }


            }
            catch (Exception ex)
            {

                litStatus.Text = ex.ToString();
            }
        }
   
        else
        {
            litStatus.Text = "<font style='color : red;'>Passwords does not match</font>";
        }
         }
        else
        {
            litStatus.Text = "<font style='color : red;'>Please fill all the required fields </font>";
        }
    }

    
}