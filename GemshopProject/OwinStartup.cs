using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.AspNet.Identity;

[assembly: OwinStartup(typeof(GemshopProject.OwinStartup))]

namespace GemshopProject
{
    public class OwinStartup
    {
        public void Configuration(IAppBuilder app)
        {
           app.UseCookieAuthentication(new CookieAuthenticationOptions
                {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath= new PathString("/loginPage.aspx")
            });
        }
    }
}
