using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using GemshopProject.Models;
namespace GemshopProject
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            Database.SetInitializer<ShopDBContext>(new GemStoreDbInitializer());
            //Database.SetInitializer(new DropCreateDatabaseAlways<ShopDBContext>());

            var context = new ShopDBContext();
            context.Database.Initialize(true);
        }
    }
}