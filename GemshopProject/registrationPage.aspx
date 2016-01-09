<%@ Page Title="registrationPage" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="registrationPage.aspx.cs" Inherits="registrationPage"  %>


<asp:Content ID="registrationPage" ContentPlaceHolderID="IndexBody" Runat="Server">


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
                        <h2>Registered Customers</h2>
                                        <asp:Literal ID="litStatus" runat="server"></asp:Literal>

                        <p>If you have an account with us, please log in.</p>
                        <div class="FullName">
                            <strong>Full Name:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="FullName" runat="server"></asp:TextBox>
                        </div>
                        <div class="UserName">
                            <strong>UserName:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="UserName" runat="server" ></asp:TextBox>
                        </div>
                        
                        <div class="password">
                            <strong>Password:</strong><sup>*</sup><br>
                            <asp:TextBox  name="" id="password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="password">
                            <strong>Confirm Password:</strong><sup>*</sup><br>
                            <asp:TextBox  name="" id="pass_confirm" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="email">
                            <strong>Email Adress:</strong><sup>*</sup><br>
                            <asp:TextBox type="email" name="" id="email" runat="server"></asp:TextBox>
                        </div>
                        <div class="ContactNum">
                            <strong>Contact Number:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="ContactNum" runat="server"></asp:TextBox>
                        </div>
                        <div class="Address">
                            <strong>Shipping Address:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="Address" runat="server"></asp:TextBox>
                        </div>
                        
                        
                        <div class="submit">
                            <asp:Button ID="createBtn" runat="server" Text="Register" OnClick="createBtn_Click" />
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

