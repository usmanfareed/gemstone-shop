<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="product_order.aspx.cs" Inherits="GemshopProject.Admin.product_order" %>
<asp:Content ID="product_order" ContentPlaceHolderID="IndexBody" runat="server">
        <form id="form2" runat="server" >

                <div class="content-page" style="overflow:auto">
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
                                <asp:GridView ID="Orders_grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" DataKeyNames="id" RowStyle-Wrap="false" OnRowDataBound="Orders_grid_RowDataBound">
                                    <Columns>
                                        
                                       
                                        
                                        
                                       
                                        
                                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                          <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                         <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" SortExpression="Order_Date" />
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                        <asp:BoundField DataField="bank_code" HeaderText="Transection code" SortExpression="bank_code" />
                                        <asp:BoundField DataField="transection_date_time" HeaderText="Transection date and time" SortExpression="transection_date_time" />
                                        <asp:BoundField DataField="total_price" HeaderText="Total price" SortExpression="total_price" />
                                        <asp:HyperLinkField HeaderText="User Info" Text="User Info" DataNavigateUrlFields="id"  DataNavigateUrlFormatString="~/checkout.aspx?customerid={0}" />
                                       <asp:HyperLinkField HeaderText="Items" Text="Items" DataNavigateUrlFields="id"  DataNavigateUrlFormatString="orderd_items.aspx?id={0}" />
                                        <asp:TemplateField HeaderText="Action" ShowHeader="False">
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

<RowStyle Wrap="False"></RowStyle>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GemshopDatabaseConnectionString %>" SelectCommand="SELECT [id], [full_name], [Order_Date], [status], [bank_code], [transection_date_time], [total_price] FROM [orders]" DeleteCommand="DELETE FROM [orders] WHERE [id] = @original_id AND [full_name] = @original_full_name AND (([Order_Date] = @original_Order_Date) OR ([Order_Date] IS NULL AND @original_Order_Date IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND [bank_code] = @original_bank_code AND (([transection_date_time] = @original_transection_date_time) OR ([transection_date_time] IS NULL AND @original_transection_date_time IS NULL)) AND [total_price] = @original_total_price" InsertCommand="INSERT INTO [orders] ([full_name], [Order_Date], [status], [bank_code], [transection_date_time], [total_price]) VALUES (@full_name, @Order_Date, @status, @bank_code, @transection_date_time, @total_price)" UpdateCommand="UPDATE [orders] SET [full_name] = @full_name, [Order_Date] = @Order_Date, [status] = @status, [bank_code] = @bank_code, [transection_date_time] = @transection_date_time, [total_price] = @total_price WHERE [id] = @original_id AND [full_name] = @original_full_name AND (([Order_Date] = @original_Order_Date) OR ([Order_Date] IS NULL AND @original_Order_Date IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND [bank_code] = @original_bank_code AND (([transection_date_time] = @original_transection_date_time) OR ([transection_date_time] IS NULL AND @original_transection_date_time IS NULL)) AND [total_price] = @original_total_price" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_id" Type="Int32" />
                                        <asp:Parameter Name="original_full_name" Type="String" />
                                        <asp:Parameter Name="original_Order_Date" Type="String" />
                                        <asp:Parameter Name="original_status" Type="String" />
                                        <asp:Parameter Name="original_bank_code" Type="Int64" />
                                        <asp:Parameter Name="original_transection_date_time" Type="String" />
                                        <asp:Parameter Name="original_total_price" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="Order_Date" Type="String" />
                                        <asp:Parameter Name="status" Type="String" />
                                        <asp:Parameter Name="bank_code" Type="Int64" />
                                        <asp:Parameter Name="transection_date_time" Type="String" />
                                        <asp:Parameter Name="total_price" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="full_name" Type="String" />
                                        <asp:Parameter Name="Order_Date" Type="String" />
                                        <asp:Parameter Name="status" Type="String" />
                                        <asp:Parameter Name="bank_code" Type="Int64" />
                                        <asp:Parameter Name="transection_date_time" Type="String" />
                                        <asp:Parameter Name="total_price" Type="Int32" />
                                        <asp:Parameter Name="original_id" Type="Int32" />
                                        <asp:Parameter Name="original_full_name" Type="String" />
                                        <asp:Parameter Name="original_Order_Date" Type="String" />
                                        <asp:Parameter Name="original_status" Type="String" />
                                        <asp:Parameter Name="original_bank_code" Type="Int64" />
                                        <asp:Parameter Name="original_transection_date_time" Type="String" />
                                        <asp:Parameter Name="original_total_price" Type="Int32" />
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

            </form>

</asp:Content>
