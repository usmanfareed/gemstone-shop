<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="GemshopProject.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">
    <script>


        //this script will populate the products data from cs class to the home page
        $(document).ready(function () {

            $.ajax({
                url: "cart.aspx/fill_page",
                data: "{}",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
            });
            function OnSuccess(data) {
                d = data.d;
                var totalprice = 0;
                var item = "";
                for (i = 0; i < d.length; i++) {
                    var subtotal = (d[i].price) * (d[i].quantity);
                    (totalprice) += (subtotal);
                    $items = $('<tr >'+
                           
                           ' <td class="images"><a href="product_page.html"><img src="' + d[i].image + '" alt="Product 10" title=""></a></td>' +
                           ' <td class="name">' + d[i].name + ' </td>' +
                           ' <td class="price">' + d[i].price + '</td>' +
                           ' <td  class="qty"> <input id="' + d[i].purchaseid + '"  type="text" class="update" onChange="update_quantity(this);" value="' + d[i].quantity + '" /> </td>' +
                           ' <td class="subtotal">' + subtotal + '</td>' +
                           ' <td class="close"><a title="close" class="close" href="cart.aspx?del=' + d[i].purchaseid + '"></a></td>' +
                            '</tr>'
)
                          $('#cart_items').append($items);
                       
                }
                var total = totalprice.toString();
                var total_price = document.getElementById("total_price");
                total_price.innerHTML = total;
               
                
                
            }
        });

    </script>



    <script>
        function update_quantity(e)
        {
            var id = $(e).attr("id");
            var value = $(e).attr("value");
            
            location.href = 'cart.aspx?pur_id='+id+'&quan='+value;


        }

    </script>
<%--    <script>


        $(document).ready(function () {
            $( "#target" ).click(function() {

                var data= {

                }

            $.ajax({
                url: "cart.aspx/fill_page",
                data: "{}",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
            });
                


    </script>--%>

    <script>



    </script>
        
    
    <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">Shopping cart</h1>
                </header>
                <article>
                    <table id="cart_items" class="cart_product">
                        <tr class="bg">
                            <th class="images"></th>
                            <th class="name">Product Name</th>
                            <th class="price">Unit Price</th>
                            <th class="qty">Qty</th>
                            <th class="subtotal">Subtotal</th>
                            <th class="close"> </th>
                        </tr>
                        </table>
                        
                    
                    <div id="cart_forms" class="negative-grid">
               
                        <div class="grid_4" style="float:right">
                            <div class="bottom_block total">
                                <table class="subtotal">
                                    
                                    <tr class="grand_total">
                                        <td>Grand Total</td><td id="total_price" class="price">$1, 500.00</td>
                                    </tr>
                                </table>
                                <button onclick="location.href = 'checkout.aspx';" class="checkout">PROCEED TO CHECKOUT <img src="img/checkout.png" alt="" title=""></button>
                            </div><!-- .total -->
                        </div><!-- .grid_4 -->

                        <div class="clear"></div>
                    </div><!-- #cart_forms -->
                    <div class="clear"></div>
		</article>
                
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->



</asp:Content>
