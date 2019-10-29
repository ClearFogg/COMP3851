<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.login" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <h1>Login</h1>
        <br />
        <div>
            <h2 style="text-align: left;">Username:</h2>
            <asp:TextBox ID="usernameBox" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
        </div>
        
        <br />
        <div>
            <h2 style="text-align: left; display: inline;">Password:</h2>
            <asp:TextBox ID="passwordBox" TextMode="Password" class="form-control" placeholder="*******" runat="server" style="display: inline;"></asp:TextBox>
            <a href="forgotPassword.aspx">Forgotten your password? Click here!</a>
            <asp:Label ID="LoginMsg" runat="server" Text=""></asp:Label>
        </div >
        <br />
        <asp:Button ID="btnSubmit" class="btnSignUp" runat="server" Text="Login" OnClick="btnSubmit_OnClick"/>
        <br />
        <br />
    </div>
</asp:Content>