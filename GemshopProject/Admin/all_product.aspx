<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="all_product.aspx.cs" Inherits="GemshopProject.Admin.all_product" %>
<asp:Content ID="all_product" ContentPlaceHolderID="IndexBody" runat="server">

                <form id="form1" runat="server">

                <div class="content-page" style="overflow:auto">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Products</h4>
								<ol class="breadcrumb">
									<li>
										<a href="#">Ubold</a>
									</li>
									<li class="active">
										Products
									</li>
								</ol>
							</div>
						</div>

                       
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                </footer>

                    <asp:GridView CssClass="table table-bordered dataTable no-footer" ID="ProductsGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="90%" OnRowEditing="ProductsGrid_RowEditing" OnRowDeleting="ProductsGrid_RowDeleting" DataKeyNames="ID" ForeColor="#666666" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnRowDataBound="ProductsGrid_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="AvailableQuantity" HeaderText="Quantity" SortExpression="AvailableQuantity" />
                            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                            <asp:BoundField DataField="DateUpdated" HeaderText="DateUpdated" SortExpression="DateUpdated" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Are you sure you want to delete?'); " CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:ImageField HeaderText="Picture" DataImageUrlField="Image" ControlStyle-Width="70" ControlStyle-Height = "70">
                            </asp:ImageField>

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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Integrated Security=True" DeleteCommand="Delete  FROM [GemshopDatabase].[dbo].[Products]
where  [ID] = @ID" InsertCommand="INSERT INTO [GemshopDatabase].[dbo].[Products] 
( [Name]
      ,[Price]
      ,[AvailableQuantity]
      ,[Description]
      ,[Image]
      ,[DateUpdated]
      ,[CategoryID]) 
VALUES (@Name,@Price,@AvailableQuantity, @Description,@Image,@DateUpdated,@CategoryID)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT
        [ID] 
      ,[Name]
      ,[Price]
      ,[AvailableQuantity]
      ,[Description]
      ,[Image]
      ,[DateUpdated]
      ,[CategoryID]
  FROM [GemshopDatabase].[dbo].[Products]" UpdateCommand="UPDATE [GemshopDatabase].[dbo].[Categories] SET ( [Name] ,[Price] ,[AvailableQuantity] ,[Description] ,[Image] ,[DateUpdated] ,[CategoryID]) VALUES (@Name,@Price,@AvailableQuantity, @Description,@Image,@DateUpdated,@CategoryID) 
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
                    </asp:SqlDataSource>

            </div>
                    </div>

                </form>
</asp:Content>
