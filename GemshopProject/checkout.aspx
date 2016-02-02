<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="GemshopProject.checkout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="IndexBody" runat="server">


    
        <div class="container_12">
            <div id="content" class="grid_12">
                <header>
                    <h1 class="page_title">Checkout</h1>
                </header>
                    
                <article id="checkout_info" class="grid_9">
		    <div class="grid_6 registed_form customDivSize">
                    <div class="registed">
                     
                        <div class="FullName">
                            <strong>Full Name:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="FullName" runat="server"></asp:TextBox>
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

                        <div class="">
                            <strong>Bank Transaction Code:</strong><sup>*</sup><br>
                            <asp:TextBox type="text" name="" id="code" runat="server"></asp:TextBox>
                        </div>
                        <div class="submit">
                            <asp:Button ID="createBtn" runat="server" Text="Confirm Order" OnClick="createBtn_Click" />
                            <input type="reset" class="button_class" value="Clear">

                            <span>* Required Field</span>
                        </div><!-- .submit -->
                        
                    </div><!-- .registed -->
                </div>
		</article><!-- #checkout_info -->
                
               
            </div><!-- #content -->

            <div class="clear"></div>
        </div><!-- .container_12 -->
    <div class="clear"></div>




</asp:Content>
