<%@ Page Title="looseGemstones" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="looseGemstones.aspx.cs" Inherits="looseGemstones" %>

<asp:Content ID="looseGemstones" ContentPlaceHolderID="IndexBody" Runat="Server">



        <script>
        //this script will populate the products data from cs class to the home page
        $(document).ready(function () {
            
            $.ajax({
                url: "looseGemstones.aspx/get_products",
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
                        '<a href="wishlist.aspx?id=' + d[i].ID + '" class="wishlist" style="left: 144px;"></a>' +
                        '<a href="cart.aspx?id=' + d[i].ID + '" class="bay" style="opacity: 1; transform: rotate(0deg)"><img src="img/bg_cart.png" alt="Buy" title=""></a></div><!-- .cart -->'

)
                    $('#product_grid').append($newproduct);
                }
                $('#product_grid').append('<div class="clear"></div>');
            }
        });

 


    </script>


    <script>
        //this script will populate the categories data from cs class to the home page
        $(document).ready(function () {
            
            $.ajax({
                url: "looseGemstones.aspx/fill_page",
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
                    $categories = $('<ul>'+
			   ' <li><a href="looseGemstones.aspx?cat_id=' + d[i].ID + '"> '+ d[i].Name +'</a></li>'+
			    
			'</ul>'
)
                    $('#categories').append($categories);
                }
                $('#categories').append('<div class="clear"></div>');
            }
        });

 


    </script>



      <div class="breadcrumbs">
        <div class="container_12">
            <div class="grid_12">
                 <a href="Home.aspx">Home</a><span></span><span class="current">LOOSE GEMSTONES</span>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->
    
    <section id="main">
        <div class="container_12">
            <div id="content" class="grid_9">
                <h1 class="page_title">GEMSTONES</h1>
             <div class="clear"></div>

                <div id="product_grid" class="products catalog negative-grid">
            

                    

            </div><!-- #content -->
                                <div class="clear"></div>
                </div>

            <div id="sidebar" class="grid_3">
                <aside id="categories_nav">
		    <header class="aside_title">
                        <h3>Categories</h3>
                    </header>

		    <nav id="categories" class="right_menu">
			
		    </nav><!-- .right_menu -->
                </aside><!-- #categories_nav -->
                

                
            </div><!-- .sidebar -->
            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->

</asp:Content>

