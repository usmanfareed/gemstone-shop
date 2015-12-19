<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeBehind="product_detail.aspx.cs" Inherits="GemshopProject.product_detail" %>
<asp:Content ID="product_detail" ContentPlaceHolderID="IndexBody" runat="server">


    <script>
        //this script will populate the products data from cs class to the home page
        $(document).ready(function () {

            $.ajax({
                url: "product_detail.aspx/get_product",
                data: "{}",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
            });
            function OnSuccess(data) {
                data = data.d;
                $("#heading").append('<h1 class="page_title">' + data[0].Name + '</h1>'),
                $("#pro_image").append('<img src="' + data[0].Image + '" alt="Product 1" title="" style="width: 100%"></a>'),
                $("#pro_price").append(' <div class="price">RS  ' + data[0].Price + '</div><!-- .price -->'),
                $("#quantity").append(' <div class="availability" >Available Quantity: <span style="color:red">' + data[0].AvailableQuantity + '</span></div>'),
                $("#description").append('<p>' + data[0].Description + '</p>');
                $("#select_quantity").append('<option> Select Quantity </option>')
                



            };
        });
            </script>

        <section id="main">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header id="heading">
                </header>
                    
                <article class="product_page negative-grid">
                    <div class="grid_5 img_slid" id="products">
			<div id="pro_image" class="preview slides_container">
			    
			    </div>
			</div><!-- .preview -->
                        
                    
                    <div class="grid_7">
			<div class="entry_content">
                            
              <div id="pro_price" class="ava_price">
                   </div><!-- .ava_price -->            
                                
				<div id="quantity" class="availability_sku">
				    
				</div><!-- .availability_sku -->
                                <div class="clear"></div>
			    
                            
                            <div class="parameter_selection">
                                <input id="select_quantity" type="text" placeholder="Please Enter Quantity"/>
                                <div class="clear"></div>
			    </div><!-- .parameter_selection -->

			    <div class="cart">
                                <a href="#" class="bay"><img src="img/bg_cart.png" alt="Buy" title="">Add to Cart</a>
                                <a href="#" class="wishlist"><span></span>Add to Wishlist</a>
                            </div><!-- .cart -->

			</div><!-- .entry_content -->
		    </div><!-- .grid_7 -->
		    <div class="clear"></div>
                    
                    <div class="grid_12" >
			<div id="wrapper_tab" class="tab1">
			    <a href="#" class="tab1 tab_link">Description</a>
		

			    <div class="clear"></div>

			    <div id="description" class="tab1 tab_body">
				<h4 >About This Item</h4>
				
                                <div class="clear"></div>
			    </div><!-- .tab1 .tab_body -->


			    <div class="clear"></div>
			</div>​<!-- #wrapper_tab -->
			<div class="clear"></div>
		    </div><!-- .grid_12 -->
		</article><!-- .product_page -->
                
                    
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->


</asp:Content>
