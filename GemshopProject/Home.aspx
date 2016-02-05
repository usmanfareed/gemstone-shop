<%@ Page Title="Home" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" Inherits="Home" Codebehind="Home.aspx.cs" %>

<asp:Content ID="Home" ContentPlaceHolderID="IndexBody" Runat="Server">
     <script src="js/jquery.anythingslider.js"></script>
    <script src="js/jquery.anythingslider.fx.js"></script>
    <script>
        //this script will populate the products data from cs class to the home page
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
                for (i = d.length-1; i >= 0; i--) {
                    $newproduct = $('<article class="grid_3 article"><div class="prev">' +
                        '<a href="product_detail.aspx?id=' + d[i].ID + '"><img src="' + d[i].Image + '" alt="Product 1" title=""></a></div>' +
                        '<h3 class="title">' + d[i].Name + '</h3>' +
                        ' <div class="cart" ><div class="price" style="left: 0px; text-align: left;"><div class="vert"> RS  ' + d[i].Price + '</div></div>' +
                        '<a href="wishlist.aspx?id=' + d[i].ID + '" class="wishlist" style="left: 144px;"></a>' +
                        '<a href="cart.aspx?id=' + d[i].ID + '" class="bay" style="opacity: 1; transform: rotate(0deg)"><img src="img/bg_cart.png" alt="Buy" title=""></a></div><!-- .cart -->'

)
                    $('#product_grid').append($newproduct);
                }
            }
        });

 


    </script>

<%--        <script>
        //this script will populate the banners from cs class to the home page slider
            $(document).ready(function () {
            
            $.ajax({
                url: "Home.aspx/fill_slider",
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
                    $banners = $('<li>' +
                      '<div class="slid_content"><a class="buy_now" href="product_detail.aspx?id=' + d[i].ProductID + '" >Buy now </a> ' +
                      '</div>' +
                      '<img src="' + d[i].image_path + '" alt="" title="">' +
                      '</li>'
)
                    $('#slider').append($banners);
                    
                }
            }
            });

 


    </script>--%>

       <div id="slider_body">
       
    <asp:Repeater ID="repeat" runat="server">
    <HeaderTemplate>
             <ul id="slider">
                </HeaderTemplate>
        <ItemTemplate>
            <li id="slide">
                <div class="slid_content">
                   
                    <a class="buy_now" href='<%# Eval("href_li")%>'>Buy now</a>
                </div>
                <img src='<%# Eval("img_li")%>' alt="Slid 2" title="" />
                 </li>
            </ItemTemplate>
        <FooterTemplate>
             </ul>
            </FooterTemplate>
        </asp:Repeater>
       
      
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

