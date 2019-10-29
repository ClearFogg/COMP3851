<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.signup" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
<div class="heroSection">
    <div class="heroRow">
        <div class="heroContainer heroWrap">
            <h1>Signup</h1>
        </div>
    </div>
	<asp:Panel ID="pageContent" runat="server">
        <div class="heroRow">
		    <div class="heroContainer heroWrap">
            <h2>Account Name:</h2>
            <br /> 
            <div style="width: 30%;">
                <asp:TextBox ID="aName" runat="server" class="form-control" placeholder="Account name"></asp:TextBox>
            </div>
            <br />
            <h2>Password:</h2>
                <div style="width: 30%">
                    <asp:TextBox ID="pword" TextMode="Password" class="form-control" placeholder="*******" runat="server" style=" margin-right:auto;"></asp:TextBox>
                </div>
            <br />
            <h2>Business Name:</h2>
                <div style="width: 30%">
                    <asp:TextBox ID="bName" class="form-control" placeholder="Business name" runat="server" style=" margin-right:auto;"></asp:TextBox>
                </div>
            <br />
            <h2>Email:</h2>
            <div style="width: 30%">
                <asp:TextBox ID="email" TextMode="Email" class="form-control" placeholder="example@user.com" runat="server" style=" margin-right:auto;"></asp:TextBox>
            </div>

            <br />
            <asp:Button ID="btnSubmit" class="btnSignUp" runat="server" Text="Submit" OnClick="btnSubmit_OnClick"/> <!--OnClick="submitButtonClick" />-->
    </asp:Panel>
            <br />
            <asp:Label ID="AccountMsg" runat="server" Text=""></asp:Label>
            <br />
            <a href="login.aspx">Already have an account? Login here!</a>
                <br />        
                        </div>
					    <div class="heroContainer heroWrap"></div>
				    </div>
				    <div class="heroRow">
					    <div class="heroContainer heroWrap"></div>
					    <div class="heroContainer heroWrap"></div>
					    <div class="heroContainer heroWrap"></div>
				    </div>
			    </div>
    
</asp:Content>