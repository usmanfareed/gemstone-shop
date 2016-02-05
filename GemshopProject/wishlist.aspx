<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="GemshopProject.wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">




    <script>

        //this script will populate the products data from cs class to the home page
        $(document).ready(function () {

            $.ajax({
                url: "wishlist.aspx/fill_page",
                data: "{}",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
            });
            function OnSuccess(data) {
                d = data.d;
                var item = "";
                for (i = 0; i < d.length; i++) {
                    $items = $('<tr >'+
                           
                           ' <td class="images"><a href="product_page.html"><img src="' + d[i].image + '" alt="Product 10" title=""></a></td>' +
                           ' <td class="name">' + d[i].name + ' </td>' +
                           ' <td class="price">' + d[i].Price + '</td>' +
                           ' <td class="close"><a title="close" class="close" href="wishlist.aspx?del=' + d[i].wishlistid + '"></a></td>' +
                            '</tr>'
)
                          $('#cart_items').append($items);
                       
                }
                
                
                
                
            }
        });

    </script>




    
    <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">Wishlist</h1>
                </header>
                <article>
                    <table id="cart_items" class="cart_product">
                        <tr class="bg">
                            <th class="images"></th>
                            <th class="name">Product Name</th>
                             <th class="price">Unit Price</th>

                            <th class="close"> </th>
                        </tr>
                        </table>
                        
                    
                   
                    <div class="clear"></div>
		</article>
                
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->







</asp:Content>
