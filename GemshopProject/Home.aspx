<%@ Page Title="Home" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" Inherits="Home" Codebehind="Home.aspx.cs" %>

<asp:Content ID="Home" ContentPlaceHolderID="IndexBody" Runat="Server">


    <script>
        $(document).ready(function () {

            $.ajax({
                url: "Home.aspx/fill_page",
                data: "{}",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
            });
            function OnSuccess(data) {
                d = data.d;
                
                var $this = $(this);
                for (i = 0; i < d.length; i++) {
                    $newproduct = $('<article class="grid_3 article"><div class="prev">' +
                        '<a href="product_detail.aspx?id=' + d[i].ID + '"><img src="' + d[i].Image + '" alt="Product 1" title=""></a></div>' +
                        '<h3 class="title">' + d[i].Name + '</h3>' +
                        ' <div class="cart" ><div class="price" style="left: 0px; text-align: left;"><div class="vert"> RS  ' + d[i].Price + '</div></div>' +
                        '<a href="#" class="wishlist" style="left: 144px;"></a>' +
                        '<a href="#" class="bay" style="opacity: 1; transform: rotate(0deg)"><img src="img/bg_cart.png" alt="Buy" title=""></a></div><!-- .cart -->'
)
                    $('#product_grid').append($newproduct);
                    alert(d[i].ID);
                }
            }
        });

 


    </script>


       <div id="slider_body">
        <ul id="slider">
            <li>
                <div class="slid_content">
                    <h2 style="color:#6f566f;">Engagement Rings</h2>
                    <p style="color:#6f566f;">The hardest part is over – you’ve found the love of 
                    your life. Now is the time to find the perfect diamond 
                    engagement ring and plan a beautiful proposal.</p>
                    <a class="buy_now" href="#">Buy now</a>
                </div><!-- .slid_content -->
                <img src="img/content/slid-1.png" alt="Slid 1" title="">
            </li>

            <li>
                <div class="slid_content">
                    <h2 style="color:#744747;">Precious Metals</h2>
                    <p style="color:#744747;">There’s no gift quite like diamond jewelry. Whether 
                    you’re looking for a diamond ring, bracelet, 
                    earrings or necklace, we’ll give you tips.</p>
                    <a class="buy_now" href="#">Buy now</a>
                </div><!-- .slid_content -->
                <img src="img/content/slid-2.png" alt="Slid 2" title="">
            </li>

            <li>
                <div class="slid_content">
                    <h2 style="color:#6d5956;">Handmade jewelry</h2>
                    <p style="color:#6d5956;">Congratulations on your engagement. As you 
                    begin to plan the many details of your wedding 
                    day, don’t forget the rings!</p>
                    <a class="buy_now" href="#">Buy now</a>
                </div><!-- .slid_content -->
                <img src="img/content/slid-3.png" alt="Slid 3" title="">
            </li>
        </ul>
    </div><!-- #slider_body -->


    <section id="main" class="home">
        <div class="container_12">
            <div id="content">
                <div class="grid_12">
                    <h2 class="product-title">Featured Products</h2>
                </div><!-- .grid_12 -->

                <div class="clear"></div>

                <div id="product_grid" class="products featured-products">
            

                    

                    <div class="clear"></div>
                </div><!-- .products -->
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>

                </div><!-- .c_header -->
        
       </section>
</asp:Content>

