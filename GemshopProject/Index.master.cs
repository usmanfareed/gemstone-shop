using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var user = Context.User.Identity;
        if(user.IsAuthenticated)
        {
            litStatus.Text = Context.User.Identity.Name + "    ";
            litwelcome.Text = "WELCOME  ";

            login.Visible = false;
            signup.Visible = false;

            logout.Visible = true;
            litStatus.Visible = true;

            orderstatus_button.Visible = true;
            wishlist_button.Visible = true;
            cart_button.Visible = true;
        }
        else
        {
            litwelcome.Text = "Welcome Visitor you can  ";
            login.Visible = true;
            signup.Visible = true;

            logout.Visible = false;
            litStatus.Visible = false;
            orderstatus_button.Visible = false;
            wishlist_button.Visible = false;
            cart_button.Visible = false;


        }

        if(Context.User.Identity.Name == "admin")
        {
            dashboard.Visible = true;
        }
        else
        {
            dashboard.Visible = false;
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        var authmanager = HttpContext.Current.GetOwinContext().Authentication;
        authmanager.SignOut();

        Response.Redirect("~/Home.aspx");

    }
}
