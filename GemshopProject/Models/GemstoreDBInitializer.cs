using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace GemshopProject.Models
{
        public class GemStoreDbInitializer : DropCreateDatabaseIfModelChanges<ShopDBContext>
        {
            protected override void Seed(ShopDBContext context)
            {
                base.Seed(context);

            

                // Add Items To Table
                context.Users.Add(new Users() { FullName = "Usman" });
                context.Users.Add(new Users() { FullName = "Ali" });
                context.Users.Add(new Users() { FullName = "saad" });


                //Finally Save Changes For Data To Be Preserved In Our Database.
                context.SaveChanges();
            
            }


    }
}