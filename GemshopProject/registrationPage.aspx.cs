using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemshopProject.Models;
using System.Web.Services;

    [System.Web.Script.Services.ScriptService]

public partial class registrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string create_user(Users context)
    {
 
        var user = new Users();
        user.FullName = context.FullName;
        user.UserName = context.UserName;
        user.Password = context.Password;
        user.Email = context.Email;
        user.Contact = context.Contact;
        user.Address = context.Address;
        Account_db account_db = new Account_db();
        account_db.create_user(user);
        return "Success";
    
    }
}