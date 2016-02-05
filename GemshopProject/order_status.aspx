<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeBehind="order_status.aspx.cs" Inherits="GemshopProject.order_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">






<script>

        //this script will populate the products data from cs class to the home page
        $(document).ready(function () {

            $.ajax({
                url: "order_status.aspx/fill_page",
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
                           
                           ' <td class="price">' + d[i].id + ' </td>' +
                           ' <td class="price">' + d[i].Order_Date + '</td>' +
                           ' <td class="price">' + d[i].total_price + '</td>' +
                           ' <td class="name">' + d[i].status + '</td>' +
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
                    <h1 class="page_title">Order Status</h1>
                </header>
                <article>
                    <table id="cart_items" class="cart_product">
                        <tr class="bg">
                            <th class="name">Order ID</th>
                            <th class="name">Date</th>
                             <th class="price">Total Price</th>
                             <th class="name">Status</th>
                        </tr>
                        </table>
                        
                    
                   
                    <div class="clear"></div>
		</article>
                
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->





</asp:Content>
