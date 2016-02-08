<%@ Page Title="loginPage" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="loginPage.aspx.cs" Inherits="loginPage" %>

<asp:Content ID="loginPage" ContentPlaceHolderID="IndexBody" Runat="Server">


  <%--  <script>
        $(document).ready(function () {
            $("#login_btn").on('click', function (e) {
                e.preventDefault();
                var Password = $("#pass").val();
                var Email = $("#email").val();
                var PostData = {
                    Email,
                    Password,
                };
                $.ajax({
                    type: "POST",
                    url: 'loginPage.aspx/login_user',
                    data: JSON.stringify(PostData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: function(output)
                    {
                        alert(output)
                       
                    
                    }
                })

            });
        });

    </script>--%>

              <div class="breadcrumbs">
        <div class="container_12">
            <div class="grid_12">
                 <a href="Home.aspx">Home</a><span></span><span class="current">LOGIN</span>
            </div><!-- .grid_12 -->
        </div><!-- .container_12 -->
    </div><!-- .breadcrumbs -->

        <section id="main" class="page-login">
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">Login or Create an Account</h1>
                </header>
                    
                <article>
                    <div class="grid_6 new_customers">
			<h2>New Customers</h2>
			<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			<div class="clear"></div>
			<a style="width:30%" class="button_class" href="registrationPage.aspx">Create An Account</a>
                        
                    </div><!-- .grid_6 -->
		
                    <div class="grid_6 registed_form">
			<div class="registed">
			    <h2>Registered Customers</h2>
			    <p>If you have an account with us, please log in.</p>
                <p>
                    <asp:Literal ID="litStatus" runat="server"></asp:Literal>
                </p>
			    <div class="email">
				<strong>User Name:</strong><sup>*</sup><br>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
			    </div><!-- .email -->
			    <div class="password">
				<strong>Password:</strong><sup>*</sup><br>
                <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
			    </div><!-- .password -->
			   
			    <div class="submit">										
				<asp:Button ID="login_btn" runat="server" Text="Login" OnClick="login_btn_Click" />
                                
                                <div class="clear"></div>
			    </div><!-- .submit -->
			</div><!-- .registed -->
                    </div><!-- .grid_6 -->
		</article>
                    
                <div class="clear"></div>
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->
    </section><!-- #main -->




</asp:Content>

