﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master_dashboard.Master" AutoEventWireup="true" CodeBehind="all_product.aspx.cs" Inherits="GemshopProject.Admin.all_product" %>
<asp:Content ID="all_product" ContentPlaceHolderID="IndexBody" runat="server">

                <div class="content-page">
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

                        <!-- SECTION FILTER
                        ================================================== -->
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 ">
                                <div class="portfolioFilter">
                                    <a href="#" data-filter="*" class="current">All</a>
                                    <a href="#" data-filter=".mobiles">Mobiles</a>
                                    <a href="#" data-filter=".tablets">Tablets</a>
                                    <a href="#" data-filter=".desktops">Desktops</a>
                                    <a href="#" data-filter=".other">Other</a>
                                </div>
                            </div>
                        </div>

                        <div class="row port">
                            <div class="portfolioContainer m-b-15">
                                <div class="col-sm-6 col-lg-3 col-md-4 mobiles">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/1.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/1.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Samsung Gallaxy</a> </h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 other">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/2.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/2.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Branded camera A1254</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-half-o" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 mobiles">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/3.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/3.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Samsung Gallaxy</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 desktops">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/4.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/4.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Apple iMac 27"</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 mobiles">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/5.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/5.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Sony xperia Aqua M4</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 other">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/6.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/6.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Branded headphone UB07</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-half-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 tablets">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/7.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/7.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Apple iPad</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 desktops">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/8.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/8.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Branded Laptop</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 mobiles">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/1.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/1.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Samsung Gallaxy</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 other">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/2.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/2.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Branded camera A1254</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-half-o" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 mobiles">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/3.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/3.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Samsung Gallaxy</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                </ul>
                                            </div>
                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-lg-3 col-md-4 desktops">
                                    <div class="product-list-box thumb">
                                        <a href="assets/images/products/big/4.jpg" class="image-popup" title="Screenshot-1">
                                            <img src="assets/images/products/big/4.jpg" class="thumb-img" alt="work-thumbnail">
                                        </a>

                                        <div class="product-action">
                                            <a href="#" class="btn btn-success btn-sm"><i class="md md-mode-edit"></i></a>
                                            <a href="#" class="btn btn-danger btn-sm"><i class="md md-close"></i></a>
                                        </div>

                                        <div class="detail">
                                            <h4 class="m-t-0 m-b-5"><a href="#" class="text-dark">Apple iMac 27"</a></h4>
                                            <div class="rating">
                                                <ul class="list-inline">
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star" href="#"></a></li>
                                                    <li><a class="fa fa-star-o" href="#"></a></li>
                                                </ul>
                                            </div>

                                            <h5 class="m-0"><span class="text-custom">$ 125</span> <span class="text-muted m-l-15"> Stock :98pcs.</span></h5>

                                        </div>
                                    </div>
                                </div>




                            </div>
                        </div> <!-- End row -->




                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                </footer>

            </div>


</asp:Content>
