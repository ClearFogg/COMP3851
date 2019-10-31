<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.login" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <h1>Login</h1>
        <div>
            <h2 style="text-align: left;">Username:</h2>
            <asp:TextBox ID="usernameBox" runat="server" placeholder="Username" class="textBox"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Password:</h2>
            <asp:TextBox ID="passwordBox" TextMode="Password" placeholder="*******" runat="server" class="textBox"></asp:TextBox>
            <p><a href="forgotPassword.aspx">Forgotten your password? Click here!</a></p>
        </div>
        <asp:Label ID="LoginMsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnSubmit" class="btnSignUp" runat="server" Text="Continue" OnClick="btnSubmit_OnClick" style="font-size: 1.2rem; margin: 0; width: 100%" />
        <br />
        <br />
    </div>
</asp:Content>