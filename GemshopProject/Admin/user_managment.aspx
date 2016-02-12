<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="user_managment.aspx.cs" Inherits="GemshopProject.Admin.user_managment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">


        			<form id="form1" runat="server" >


        			<div class="content-page" >
				<!-- Start content -->
				<div class="content">
					<div class="container">

						<!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Manage Users</h4>
								<ol class="breadcrumb">
									<li>
										<a href="#">User Management</a>
									</li>
									
								
								</ol>
							</div>
						</div>



                        <div class="panel">
                            
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="m-b-30">
                                            <a href="/registrationPage.aspx"  class="btn btn-default btn-md waves-effect waves-light m-b-30" > Add User</a>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="CategoriesGrid" class="user_table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" DataKeyNames="ID,AuthID" RowStyle-Wrap="false">
                                    <Columns>
                                        
                                        
                                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                        <asp:BoundField DataField="reg_Date" HeaderText="reg_Date" SortExpression="reg_Date" />
                                        <asp:TemplateField HeaderText="   Action" ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?'); " CommandName="Delete" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GemshopDatabaseConnectionString %>" SelectCommand="SELECT [ID], [FullName],[AuthID],[Email], [Contact], [Address], [reg_Date] FROM [Users]" DeleteCommand="Delete  FROM [GemshopDatabase].[dbo].[Users] 
        
where  [AuthID] = @AuthID

Delete
FROM [GemshopDatabase].[dbo].[AspNetUsers]

 where [Id] = @AuthID" InsertCommand="INSERT INTO [Users] ( [FullName] ,[Email],[Contact],[Address] ) VALUES (@FullName, @Email, @Contact, @Address)" UpdateCommand="UPDATE [Users] SET  [FullName] = @FullName, [Email] = @Email, [Contact] = @Contact, [Address] = @Address
 WHERE [ID] = @ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="AuthID"  />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="FullName" />
                                        <asp:Parameter Name="Email" />
                                        <asp:Parameter Name="Contact" />
                                        <asp:Parameter Name="Address" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="FullName" />
                                        <asp:Parameter Name="Email" />
                                        <asp:Parameter Name="Contact" />
                                        <asp:Parameter Name="Address" />
                                        <asp:Parameter Name="ID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Integrated Security=True" DeleteCommand="Delete  FROM [GemshopDatabase].[dbo].[Categories]
where  [ID] = @ID" InsertCommand="INSERT INTO [GemshopDatabase].[dbo].[Categories] ( [Name],  [Description]) VALUES (@Name, @Description)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT *
  FROM [GemshopDatabase].[dbo].[Categories]" UpdateCommand="UPDATE [GemshopDatabase].[dbo].[Categories] SET  [Name] = @Name, [Description] = @Description
 WHERE [ID] = @ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Name" />
                                        <asp:Parameter Name="Description" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Name" />
                                        <asp:Parameter Name="Description" />
                                        <asp:Parameter Name="ID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                
                                
                            </div>
                            <!-- end: page -->

                        </div> <!-- end Panel -->
                        
                        
                       
                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer">

                </footer>



</div>
                    </form>



</asp:Content>
