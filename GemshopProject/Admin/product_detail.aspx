﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="product_detail.aspx.cs" Inherits="GemshopProject.Admin.product_detail" %>

             

<asp:Content ID="product_detail" ContentPlaceHolderID="IndexBody" runat="server">
    <form id="form2" runat="server" >


   <%-- <script>

        $(document).ready(function(){
            window.onbeforeunload = function () { }
                    $('#droplist').append(
                    $('<option></option>').val('0').html('Please Wait...')                    
                );
        
            
                    $.ajax({
                        url: "product_detail.aspx/get_category_list",
                        data: "{}",
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: OnSuccess,
                    });
                    function OnSuccess(data) {
                    $('#droplist').empty();
                    var d = data.d;
                    var dropdown = $('#droplist');
                    for (var i = 0; i < d.length ; i++) {
                    if(d[i].Name != null){
                    dropdown.append(

                     $('<option></option>').val(d[i].ID.toString()).html(d[i].Name.toString())
                    );
                }
                else {
                    break;
                }
            }
            //for keep data after postback
<%--            $('#droplist').val($('#<%=hfSelectedValue.ClientID%>').val());--%>
        }

        });




    


    <%-- <script>
         <%--  $(document).ready(function () {
             $('<%= btnupload.clientid %>')( function (e) {
                 e.preventdefault();});
             });--%>
   <%--      $(document).ready(function () {
             $("#<%=btnupload.clientid%>").dialog({ autoopen: false });
             $("#<%=btnupload.clientid%>").click(function () {
                 $("#<%=btnupload.clientid%>").dialog("open");
             });
         });
            </script>--%>
    
    
    <script>
        $(document).ready(function () {
            $("#createBtn").on('click', function (e) {
                e.preventDefault();
                var Name = $("#product_name").val();
                var CategoryID = parseInt($("#droplist").val());
                var Price = parseInt($("#product_price").val());
                var DateAdded = new Date();
                var AvailableQuantity = parseInt($("#product_quantity").val());
                var Description = $("#product_description").val();
                var image = $("#image").val();

                var PostData = {
                    Name,
                    CategoryID,
                    Price,
                    DateAdded,
                    AvailableQuantity,
                    Description,
                    image
                };
                $.ajax({
                    type: "POST",
                    url: 'product_detail.aspx/insert_product',
                    data: '{context:' + JSON.stringify(PostData) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: function (output) {

                        //location.reload();


                    }
                })

            });
        });
    </script>


    <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <!-- Page-Title -->
						<div class="row">
							<div class="col-sm-12">
								<h4 class="page-title">Add Product</h4>
								<ol class="breadcrumb">
									
                                    <li>
										<a href="#">eCommerce</a>
									</li>
									<li class="active">
										Add
									</li>
								</ol>
							</div>
						</div>



                        <div class="row">
                            <div class="col-sm-12">


                                    </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="card-box">



                                                    <h5 class="text-muted text-uppercase m-t-0 m-b-20"><b>General</b></h5>
                                                                                                     <asp:Literal ID="litStatus" runat="server"></asp:Literal>

                                                    <div class="form-group m-b-20">
                                                        <label>Product name <span class="text-danger">*</span></label>
                                                        <asp:TextBox id="product_name" class="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    
                                                    

                                                    <div class="form-group m-b-20">
                                                        <label>Categories <span class="text-danger">*</span></label>
                                                        <asp:DropDownList ID="droplist" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                        

                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ID]
      ,[Name]
  FROM [GemshopDatabase].[dbo].[Categories]"></asp:SqlDataSource>
                                                        

                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label>Price <span class="text-danger">*</span></label>
                                                        <asp:TextBox id="product_price" class="form-control"  runat="server"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label class="m-b-15">Quantity <span class="text-danger">*</span></label>
                                                        <br/>
                                                        <asp:TextBox id="product_quantity" class="form-control" runat="server"></asp:TextBox>

                                                    </div>
                                                    
                                                    <div class="form-group m-b-20">
                                                        <label class="m-b-15">Size in Carat <span class="text-danger">*</span></label>
                                                        <br/>
                                                        <asp:TextBox id="size" class="form-control" runat="server"></asp:TextBox> 

                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label>Product Description <span class="text-danger">*</span></label>
                                                        <asp:TextBox id="product_description" class="form-control" rows="5" placeholder="Please enter description" runat="server" Height="85px" TextMode="MultiLine" Width="700px"></asp:TextBox>
                                                    </div>


                                                </div>
                                            </div>


                                            <div class="col-lg-6">
                                                

                                                <div class="card-box">
                                                    <h5 class="text-muted text-uppercase m-t-0 m-b-30"><b>Product Image</b></h5>

                                                    

                                                    <div class="text-center m-t-30">
                                                        
                                                       

                                                                <div class="">
                                                                

                                                            <asp:FileUpload ID="import_image" accept=".png,.jpg,.jpeg,.gif" AllowMultiple="false" runat="server" CssClass="fileupload btn btn-purple btn-md w-md waves-effect waves-light ion-upload m-r-5" />

<%--                                                            <asp:Button runat="server" OnClientClick="" ID="btnUpload"  Text="Upload" OnClick="uploadBtn_Click" CssClass="upload" UseSubmitBehavior="true" />--%>
<%--                                                            <input runat="server" id="btnUpload"  onclick="upload_btn_Click"  type="button" class="upload">--%>

                                                       <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label> 

                                                        </div>


                                                      </div>
                                                    </div>
                                                </div>   
                                                 
                                                                


                                        <div class="row">
                                            <div class="col-sm-12">
                                                <hr />
                                                <div class="text-center p-20">
                                                     <button runat="server" onserverclick="createBtn_Click" type="submit"  class="btn btn-default btn-rounded waves-effect waves-light">Save</button>
                                                     <button type="reset" class="btn btn-danger btn-rounded waves-effect waves-light">Clear</button>


                                                </div>
                                            </div>
                                        </div>
                               
                            


                    </div> <!-- container -->
                               
                </div> <!-- content -->

              
    </div>
            </div>
        </div>
        </form>
</asp:Content>
