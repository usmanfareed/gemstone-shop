                   <%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="orderd_items.aspx.cs" Inherits="GemshopProject.Admin.orderd_items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">




                    <form id="form4" runat="server" >

                <div class="content-page" style="overflow:auto">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Orderd Items</h4>
								<ol class="breadcrumb">
								
									
								</ol>
							</div>
						</div>

                       
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                </footer>

                    <asp:GridView CssClass="table table-bordered dataTable no-footer" ID="odered_items_Grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ordersID" HeaderText="ordersID" SortExpression="ordersID" />
                            <asp:BoundField DataField="ID" HeaderText="Product ID" SortExpression="ID" InsertVisible="False" ReadOnly="True"/>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price per unit" SortExpression="Price" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/product_detail.aspx?id={0}" HeaderText="Link" Text="Product Info" />


                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#6afbcc" Font-Bold="True" ForeColor="#666666" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#ccffcc" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Initial Catalog=GemshopDatabase;Integrated Security=True"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT ordered_items.ordersID, Products.ID,  Products.Name,Products.Price, ordered_items.quantity FROM ordered_items
INNER JOIN Products
ON ordered_items.product_id=Products.ID
WHERE ordered_items.[ordersID]=@order_id;"



                         UpdateCommand="UPDATE [GemshopDatabase].[dbo].[Categories] SET ( [Name] ,[Price] ,[AvailableQuantity] ,[Description] ,[Image] ,[DateUpdated] ,[CategoryID]) VALUES (@Name,@Price,@AvailableQuantity, @Description,@Image,@DateUpdated,@CategoryID) 
WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" />
                            <asp:Parameter Name="Price" />
                            <asp:Parameter Name="AvailableQuantity" />
                            <asp:Parameter Name="Description" />
                            <asp:Parameter Name="Image" />
                            <asp:Parameter Name="DateUpdated" />
                            <asp:Parameter Name="CategoryID" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" />
                            <asp:Parameter Name="Price" />
                            <asp:Parameter Name="AvailableQuantity" />
                            <asp:Parameter Name="Description" />
                            <asp:Parameter Name="Image" />
                            <asp:Parameter Name="DateUpdated" />
                            <asp:Parameter Name="CategoryID" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                        <SelectParameters>
        <asp:QueryStringParameter QueryStringField="id" Name="order_id" />
    </SelectParameters>
                    </asp:SqlDataSource>

            </div>


                </form>




</asp:Content>
