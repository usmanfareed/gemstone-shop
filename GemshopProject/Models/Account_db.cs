using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;


namespace GemshopProject.Models
{
    public class Account_db
    {

        public void create_user(Users context)
        {
            ShopDBContext db = new ShopDBContext();
            db.Users.Add(context);
            db.SaveChanges();
        }

        public void login_user(string name,char pass)
        {

        }
    }
}