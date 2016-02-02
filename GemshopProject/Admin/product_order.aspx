<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="product_order.aspx.cs" Inherits="GemshopProject.Admin.product_order" %>
<asp:Content ID="product_order" ContentPlaceHolderID="IndexBody" runat="server">
        <form id="form2" runat="server">

                <div class="content-page">
                <!-- Start content -->
                				<div class="content">
					<div class="container">

						<!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Orders</h4>
								<ol class="breadcrumb">
									
									
								
								</ol>
							</div>
						</div>



                        <div class="panel">
                            
                            <div class="panel-body">
                                <div class="row">
                                   
                                </div>
                                <asp:GridView ID="Orders_grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" DataKeyNames="id">
                                    <Columns>
                                        
                                        
                                        
                                        
                                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />
                                        <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="contact_num" HeaderText="contact_num" SortExpression="contact_num" />
                                        <asp:BoundField DataField="current_address" HeaderText="current_address" SortExpression="current_address" />
                                        <asp:BoundField DataField="total_price" HeaderText="total_price" SortExpression="total_price" />
                                        <asp:BoundField DataField="bank_code" HeaderText="bank_code" SortExpression="bank_code" />
                                        <asp:HyperLinkField Text="Items" DataNavigateUrlFields="id"  DataNavigateUrlFormatString="orderd_items.aspx?id={0}" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />




                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Initial Catalog=GemshopDatabase;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orders]" DeleteCommand="DELETE FROM [orders] WHERE [id] = @original_id AND (([User_ID] = @original_User_ID) OR ([User_ID] IS NULL AND @original_User_ID IS NULL)) AND (([full_name] = @original_full_name) OR ([full_name] IS NULL AND @original_full_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [contact_num] = @original_contact_num AND (([current_address] = @original_current_address) OR ([current_address] IS NULL AND @original_current_address IS NULL)) AND [total_price] = @original_total_price AND [bank_code] = @original_bank_code" InsertCommand="INSERT INTO [orders] ([User_ID], [full_name], [email], [contact_num], [current_address], [total_price], [bank_code]) VALUES (@User_ID, @full_name, @email, @contact_num, @current_address, @total_price, @bank_code)" UpdateCommand="UPDATE [orders] SET [User_ID] = @User_ID, [full_name] = @full_name, [email] = @email, [contact_num] = @contact_num, [current_address] = @current_address, [total_price] = @total_price, [bank_code] = @bank_code WHERE [id] = @original_id AND (([User_ID] = @original_User_ID) OR ([User_ID] IS NULL AND @original_User_ID IS NULL)) AND (([full_name] = @original_full_name) OR ([full_name] IS NULL AND @original_full_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [contact_num] = @original_contact_num AND (([current_address] = @original_current_address) OR ([current_address] IS NULL AND @original_current_address IS NULL)) AND [total_price] = @original_total_price AND [bank_code] = @original_bank_code" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_id" Type="Int32" />
                                        <asp:Parameter Name="original_User_ID" Type="String" />
                                        <asp:Parameter Name="original_full_name" Type="String" />
                                        <asp:Parameter Name="original_email" Type="String" />
                                        <asp:Parameter Name="original_contact_num" Type="Int64" />
                                        <asp:Parameter Name="original_current_address" Type="String" />
                                        <asp:Parameter Name="original_total_price" Type="Int32" />
                                        <asp:Parameter Name="original_bank_code" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="User_ID" Type="String" />
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="contact_num" Type="Int64" />
                                        <asp:Parameter Name="current_address" Type="String" />
                                        <asp:Parameter Name="total_price" Type="Int32" />
                                        <asp:Parameter Name="bank_code" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="User_ID" Type="String" />
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="contact_num" Type="Int64" />
                                        <asp:Parameter Name="current_address" Type="String" />
                                        <asp:Parameter Name="total_price" Type="Int32" />
                                        <asp:Parameter Name="bank_code" Type="Int32" />
                                        <asp:Parameter Name="original_id" Type="Int32" />
                                        <asp:Parameter Name="original_User_ID" Type="String" />
                                        <asp:Parameter Name="original_full_name" Type="String" />
                                        <asp:Parameter Name="original_email" Type="String" />
                                        <asp:Parameter Name="original_contact_num" Type="Int64" />
                                        <asp:Parameter Name="original_current_address" Type="String" />
                                        <asp:Parameter Name="original_total_price" Type="Int32" />
                                        <asp:Parameter Name="original_bank_code" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                
                                
                            </div>
                            <!-- end: page -->

                        </div> <!-- end Panel -->
                        
                        
                       
                    </div> <!-- container -->
                               
                </div> <!-- content -->
<!-- content -->

                <footer class="footer text-right">
                    2015 © Ubold.
                </footer>

            </div>
            </form>

</asp:Content>
