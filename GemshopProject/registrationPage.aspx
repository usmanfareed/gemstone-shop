<%@ Page Title="registrationPage" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="registrationPage.aspx.cs" Inherits="registrationPage"  %>


<asp:Content ID="registrationPage" ContentPlaceHolderID="IndexBody" Runat="Server">

    <script>
        $(document).ready(function () {
            $("#createBtn").on('click', function (e) {
                e.preventDefault();
                var FullName = $("#FullName").val();
                var UserName = $("#UserName").val();
                var Password = $("#password").val();
                var Email = $("#email").val();
                var ContactNum = $("#ContactNum").val();
                var Address = $("#Address").val();
                var PostData = {
                    UserName,
                    Password,
                    FullName,
                    Email,
                    ContactNum,
                    Address
                };
                $.ajax({
                    type: "POST",
                    url: 'registrationPage.aspx/create_user',
                    data: '{context:' + JSON.stringify(PostData) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: function(output)
                    {
                        
                        alert(output)
                       
                    
                    }
                })

            });
        });

    </script>


    <%-- The Body Starts from here --%>

    <section id="main" class="page-login">
    <div class="container_12">
        <div id="content" class="grid_12">
            <header>
                <h1 class="page_title">Create an Account</h1>
            </header>

            <article>
                        

                <div class="grid_6 registed_form customDivSize">
                    <div class="registed">
                        <h2>Registed Customers</h2>
                        <p>If you have an account with us, please log in.</p>
                        <div class="FullName">
                            <strong>Full Name:</strong><sup>*</sup><br>
                            <input type="text" name="" id="FullName" value="">
                        </div>
                        <div class="UserName">
                            <strong>UserName:</strong><sup>*</sup><br>
                            <input type="text" name="" id="UserName" value="">
                        </div>
                        <div class="password">
                            <strong>Password:</strong><sup>*</sup><br>
                            <input type="text" name="" id="password" value="">
                        </div>
                        <div class="email">
                            <strong>Email Adress:</strong><sup>*</sup><br>
                            <input type="email" name="" id="email" value="">
                        </div>
                        <div class="ContactNum">
                            <strong>Contact Number:</strong><sup>*</sup><br>
                            <input type="text" name="" id="ContactNum" value="">
                        </div>
                        <div class="Address">
                            <strong>Shipping Address:</strong><sup>*</sup><br>
                            <input type="text" name="" id="Address" value="">
                        </div>
                        
                        
                        <div class="submit">
                            <input id="createBtn" type="Submit" value="Register">
                            <input type="reset" class="button_class" value="Clear">

                            <span>* Required Field</span>
                        </div><!-- .submit -->
                        
                    </div><!-- .registed -->
                </div><!-- .grid_6 -->
            </article>

            <div class="submit"></div>
        </div><!-- #content -->
        <div class="clear"></div>
    </div><!-- .container_12 -->
</section><!-- #main -->




</asp:Content>

