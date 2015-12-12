<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="manage_category.aspx.cs" Inherits="GemshopProject.Admin.manage_category" %>
<asp:Content ID="manage_category" ContentPlaceHolderID="IndexBody" runat="server">

    		<!-- Plugin Css-->
        <link rel="stylesheet" href="assets/plugins/magnific-popup/dist/magnific-popup.css" />
        <link rel="stylesheet" href="assets/plugins/jquery-datatables-editable/datatables.css" />
        <link href="assets/plugins/custombox/dist/custombox.min.css" rel="stylesheet">
       <!-- Modal-Effect -->
        <script src="assets/plugins/custombox/dist/custombox.min.js"></script>
        <script src="assets/plugins/custombox/dist/legacy.min.js"></script>



        <script>
        $(document).ready(function () {
            $("#createBtn").on('click', function (e) {
                e.preventDefault();
                var Name = $("#category_name").val();
                var Description = $("#category_description").val();
                var PostData = {
                    Name,
                    Description
                };
                $.ajax({
                    type: "POST",
                    url: 'manage_category.aspx/insert_category',
                    data: '{context:' + JSON.stringify(PostData) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: function(output)
                    {
                        
                        location.reload();

                    
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
								<h4 class="page-title">Manage Category</h4>
								<ol class="breadcrumb">
									<li>
										<a href="#">eCommerce</a>
									</li>
									
									<li class="active">
										Category
									</li>
								</ol>
							</div>
						</div>



                        <div class="panel">
                            
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="m-b-30">
<%--                                            <button id="addToTable" class="btn btn-default waves-effect waves-light">Add <i class="fa fa-plus"></i></button>--%>
                                            <a href="#custom-modal" class="btn btn-default btn-md waves-effect waves-light m-b-30" data-animation="fadein" data-plugin="custommodal" 
			                                                    	data-overlaySpeed="200" data-overlayColor="#36404a"><i class="md md-add"></i> Add Category</a>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="">
                                	<table class="table table-striped" id="datatable-editable">
	                                    <thead>
	                                        <tr>
	                                            <th>Category Name</th>
	                                            <th>Description</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr class="gradeX">
	                                            <td>Trident</td>
	                                            <td>Internet Explorer 4.0</td>
	                                            <td class="actions">
	                                                <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
	                                                <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
	                                                <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
	                                                <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
	                                            </td>
	                                        </tr>
	                                       

	                                    </tbody>
	                                </table>
                                </div>
                            </div>
                            <!-- end: page -->

                        </div> <!-- end Panel -->
                        
                        
                       
                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer">

                </footer>

            </div>


      <!-- Modal Add Category -->
			<div id="custom-modal" class="modal-demo">
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
			    <h4 class="custom-modal-title">Add Category</h4>
			    <div class="custom-modal-text text-left">
			        <div role="form">
			        	<div class="form-group">
                            <label for="name">Category Name</label>
                            <input type="text" class="form-control" id="category_name" placeholder="Enter name">
                        </div>
                        
                        	<div class="form-group">
                            <label for="name">Category Description</label>
                            <input type="text" class="form-control" id="category_description" placeholder="Enter name">
                        </div>
                        
                        
                        <button type="submit" id="createBtn" class="btn btn-default waves-effect waves-light">Save</button>
                        <button type="button" onclick="Custombox.close();" class="btn btn-danger waves-effect waves-light m-l-10">Cancel</button>
                    </div>
			    </div>
			</div>
                
            <!-- MODAL -->
            <div id="dialog" class="modal-block mfp-hide">
                <section class="panel panel-info panel-color">
                    <header class="panel-heading">
                        <h2 class="panel-title">Are you sure?</h2>
                    </header>
                    <div class="panel-body">
                        <div class="modal-wrapper">
                            <div class="modal-text">
                                <p>Are you sure that you want to delete this row?</p>
                            </div>
                        </div>

                        <div class="row m-t-20">
                            <div class="col-md-12 text-right">
                                <button id="dialogConfirm" class="btn btn-primary waves-effect waves-light">Confirm</button>
                                <button id="dialogCancel" class="btn btn-default waves-effect">Cancel</button>
                            </div>
                        </div>
                    </div>
                    
                </section>
            </div>
            <!-- end Modal -->


    <%--Script--%>
       <script>
            var resizefunc = [];
        </script>


       <script src="assets/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	    <script src="assets/plugins/jquery-datatables-editable/jquery.dataTables.js"></script> 
	    <script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
	    <script src="assets/plugins/tiny-editable/mindmup-editabletable.js"></script>
	    <script src="assets/plugins/tiny-editable/numeric-input-example.js"></script>
	    
	    
	    <script src="assets/pages/datatables.editable.init.js"></script>
	    
	    <script>
			$('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();
			
		</script>
        
        

</asp:Content>
