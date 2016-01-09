using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Models;


namespace GemshopProject.Admin.Models
{
    public class UserinfoModel
    {

        public Users Get_userinfo(string AuthID)
        {
            ShopDBContext db = new ShopDBContext();
            Users info = (from x in db.Users
                          where x.AuthID == AuthID
                          select x).FirstOrDefault();
            return info;
        }

        public void Insert_userinfo(Users info)
        {
            ShopDBContext db = new ShopDBContext();
            db.Users.Add(info);
            db.SaveChanges();
        }

    }
}