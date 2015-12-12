<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="product_detail.aspx.cs" Inherits="GemshopProject.Admin.product_detail" %>


<asp:Content ID="product_detail" ContentPlaceHolderID="IndexBody" runat="server">
    <script>

        $(document).ready(function(){

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




    </script>

    <script>
        $(document).ready(function () {
            $("#createBtn").on('click', function (e) {
                e.preventDefault();
                var Name = $("#product_name").val();
                var CategoryID = $("#droplist").val();
                var Price = $("#product_price").val();
                var DateAdded = new Date();
                var AvailableQuantity = $("#product_quantity").val();
                var Description = $("#product_description").val();
                var PostData = {
                    Name,
                    CategoryID,
                    Price,
                    DateAdded,
                    AvailableQuantity,
                    Description
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


                                    <form>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="card-box">
                                                    <h5 class="text-muted text-uppercase m-t-0 m-b-20"><b>General</b></h5>

                                                    <div class="form-group m-b-20">
                                                        <label>Product name <span class="text-danger">*</span></label>
                                                        <input id="product_name"   type="text" class="form-control">
                                                    </div>

                                                    
                                                    

                                                    <div class="form-group m-b-20">
                                                        <label>Categories <span class="text-danger">*</span></label>
                                                        <select id="droplist" class="form-control select2">
                                                          
                                                        
                                                        </select>

                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label>Price <span class="text-danger">*</span></label>
                                                        <input id="product_price" type="text" class="form-control">
                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label class="m-b-15">Quantity <span class="text-danger">*</span></label>
                                                        <br/>
                                                          <input id="product_quantity" type="text" class="form-control">

                                                    </div>

                                                    <div class="form-group m-b-20">
                                                        <label>Product Description <span class="text-danger">*</span></label>
                                                        <textarea id="product_description" class="form-control" rows="5" placeholder="Please enter description"></textarea>
                                                    </div>


                                                </div>
                                            </div>


                                            <div class="col-lg-6">
                                                

                                                <div class="card-box">
                                                    <h5 class="text-muted text-uppercase m-t-0 m-b-30"><b>Product Image</b></h5>

                                                    <div class="table-box m-b-30">
                                                        <div class="table-detail">
                                                            <img src="assets/images/products/iphone.jpg" class="thumb-md" alt="img">
                                                        </div>
                                                        <div class="table-detail">
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio4" value="option1" name="radioInline2" checked="">
                                                                <label for="inlineRadio4"> Main Image </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio5" value="option2" name="radioInline2">
                                                                <label for="inlineRadio5"> Thumbnail </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio6" value="option3" name="radioInline2">
                                                                <label for="inlineRadio6"> Gallary </label>
                                                            </div>
                                                        </div>

                                                        <div class="table-detail table-actions-bar" style="min-width: 60px;">
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                    	    <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="table-box m-b-30">
                                                        <div class="table-detail">
                                                            <img src="assets/images/products/imac.jpg" class="thumb-md" alt="img">
                                                        </div>
                                                        <div class="table-detail">
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio7" value="option1" name="radioInline3">
                                                                <label for="inlineRadio7"> Main Image </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio8" value="option2" name="radioInline3" checked="">
                                                                <label for="inlineRadio8"> Thumbnail </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio9" value="option3" name="radioInline3">
                                                                <label for="inlineRadio9"> Gallary </label>
                                                            </div>
                                                        </div>

                                                        <div class="table-detail table-actions-bar" style="min-width: 60px;">
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                    	    <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="table-box m-b-30">
                                                        <div class="table-detail">
                                                            <img src="assets/images/products/samsung.jpg" class="thumb-md" alt="img">
                                                        </div>
                                                        <div class="table-detail">
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio10" value="option1" name="radioInline4">
                                                                <label for="inlineRadio10"> Main Image </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio11" value="option2" name="radioInline4">
                                                                <label for="inlineRadio11"> Thumbnail </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio12" value="option3" name="radioInline4" checked="">
                                                                <label for="inlineRadio12"> Gallary </label>
                                                            </div>
                                                        </div>

                                                        <div class="table-detail table-actions-bar" style="min-width: 60px;">
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                    	    <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="table-box m-b-30">
                                                        <div class="table-detail">
                                                            <img src="assets/images/products/macbook.jpg" class="thumb-md" alt="img">
                                                        </div>
                                                        <div class="table-detail">
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio13" value="option1" name="radioInline5" checked="">
                                                                <label for="inlineRadio13"> Main Image </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio14" value="option2" name="radioInline5">
                                                                <label for="inlineRadio14"> Thumbnail </label>
                                                            </div>
                                                            <div class="radio radio-inline">
                                                                <input type="radio" id="inlineRadio15" value="option3" name="radioInline5">
                                                                <label for="inlineRadio15"> Gallary </label>
                                                            </div>
                                                        </div>

                                                        <div class="table-detail table-actions-bar" style="min-width: 60px;">
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                    	    <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="text-center m-t-30">
                                                        <div class="fileupload btn btn-purple btn-md w-md waves-effect waves-light">
                                                            <span><i class="ion-upload m-r-5"></i>Upload</span>
                                                            <input type="file" class="upload">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                        <div class="row">
                                            <div class="col-sm-12">
                                                <hr />
                                                <div class="text-center p-20">
                                                     <button type="reset" class="btn w-sm btn-white waves-effect">Clear</button>
                                                     <button type="button" id="createBtn" class="btn w-sm btn-default waves-effect waves-light">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>



                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                    2015 © Ubold.
                </footer>

            </div>

</asp:Content>
