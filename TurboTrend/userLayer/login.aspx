<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.login" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
<div class="heroSection">
    <div class="heroRow">
        <div class="heroContainer heroWrap">
            <h1>Login</h1>
        </div>
    </div>
	    <div class="heroRow">
		<div class="heroContainer heroWrap">
        <h2>Account Name:</h2>
        <br /> 
        <div style="width: 30%;">
            <asp:TextBox ID="usernameBox" runat="server" class="form-control" placeholder="Acount name"></asp:TextBox>
        </div>
        <br />
        <h2>Password:</h2>
        <div style="width: 30%">
            <asp:TextBox ID="passwordBox" TextMode="Password" class="form-control" placeholder="*******" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <br />
        <asp:Label ID="LoginMsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnSubmit" class="btnSignUp" runat="server" Text="Login" OnClick="btnSubmit_OnClick"/> <!--OnClick="submitButtonClick" />-->
        <br />
        <a href="forgotPassword.aspx">Forgotten your password? Click here!</a>
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