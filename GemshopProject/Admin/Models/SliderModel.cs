using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GemshopProject.Admin.Models;
using GemshopProject.Models;
namespace GemshopProject.Admin.Models
{
    public class SliderModel
    {
        public string insert_slider(slider slider)
        {
            try
            {
                ShopDBContext db = new ShopDBContext();
                db.Slider.Add(slider);
                db.SaveChanges();

                return slider.Name + "was successfully inserted";
            }
            catch (Exception e)
            {
                ShopDBContext db = new ShopDBContext();

                return "Error" + e;

            }

        }


        public List<slider> get_all_banners()
        {
            try
            {
                using (ShopDBContext db = new ShopDBContext())
                {
                    List<slider> banners = (from x in db.Slider
                                                 select x).ToList();
                    return banners;
                }
            }
            catch (Exception)
            {

                return null;
            }

        }


    }
}