<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="slider_managment.aspx.cs" Inherits="GemshopProject.Admin.slider_managment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">
    <form runat="server">


        <div class="content-page">
				<!-- Start content -->
				<div class="content">
					<div class="container">

						<!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Manage Users</h4>
								<ol class="breadcrumb">
									<li>
										<a href="#">Slider Managment</a>
									</li>
									
								
								</ol>
							</div>
						</div>



                        <div class="panel">
                            
                            <div class="panel-body">
                                <div class="row">
                                    <div class="">
                                        <div class="m-b-30">
                                            Name: <asp:textbox ID="name" runat="server" ></asp:textbox>
                                            Select Product: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" Height="23px" Width="199px"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GemshopDatabaseConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Products]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GemshopDatabaseConnectionString %>" SelectCommand="SELECT [ID], [Name], [image_path] FROM [sliders]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [sliders] WHERE [ID] = @original_ID AND [Name] = @original_Name AND [image_path] = @original_image_path" InsertCommand="INSERT INTO [sliders] ([Name], [image_path]) VALUES (@Name, @image_path)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [sliders] SET [Name] = @Name, [image_path] = @image_path WHERE [ID] = @original_ID AND [Name] = @original_Name AND [image_path] = @original_image_path">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                                    <asp:Parameter Name="original_Name" Type="String" />
                                                    <asp:Parameter Name="original_image_path" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Name" Type="String" />
                                                    <asp:Parameter Name="image_path" Type="String" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Name" Type="String" />
                                                    <asp:Parameter Name="image_path" Type="String" />
                                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                                    <asp:Parameter Name="original_Name" Type="String" />
                                                    <asp:Parameter Name="original_image_path" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:FileUpload ID="import_image" accept=".png,.jpg,.jpeg,.gif" AllowMultiple="false" runat="server" CssClass="fileupload btn btn-purple btn-md w-md waves-effect waves-light ion-upload m-r-5"  />
                                            <a runat="server" onserverclick="create_ServerClick" style="float:right;margin-right: 75px;padding: 13px" class="btn btn-default btn-md waves-effect waves-light m-b-30" > Add Slider Image</a>

                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="SliderGrid" runat="server" AllowPaging="True" AllowSorting="True" OnRowDeleting="SliderGrid_RowDeleting" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="ID">
                                    <Columns>
                                        
                                        
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="image_path" HeaderText="image_path" SortExpression="image_path" />
                                                                                <asp:CommandField ShowDeleteButton="True" />

                                    </Columns>
                                    </asp:GridView>
                                        
                                        
                                
                                
                            </div>
                            <!-- end: page -->

                        </div> <!-- end Panel -->
                        
                        
                       
                    </div> <!-- container -->
                               
                </div> <!-- content -->

             

            </div>

  
    </form>

</asp:Content>
