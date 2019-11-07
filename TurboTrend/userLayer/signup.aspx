<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.signup" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
    <h1>Sign Up</h1>
	<asp:Panel ID="pageContent" runat="server">
        <div>
            <h2 style="text-align: left;">Account Name:</h2>
            <asp:TextBox ID="aName" runat="server" class="textBox" placeholder="Account name"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Password:</h2>
            <asp:TextBox ID="pword" TextMode="Password" class="textBox" placeholder="*******" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Business Name:</h2>
            <asp:TextBox ID="bName" class="textBox" placeholder="Business name" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Email:</h2>
            <asp:TextBox ID="email" TextMode="Email" class="textBox" placeholder="example@user.com" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Phone:</h2>
            <asp:TextBox ID="phone" TextMode="Phone" class="textBox" placeholder="Phone" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <div style="margin-top: 3%;">
            <h2 style="text-align: left;">Industry:</h2>
            <asp:TextBox ID="industry" class="textBox" placeholder="Industry" runat="server" style=" margin-right:auto;"></asp:TextBox>
        </div>
        <p><a href="login.aspx">Already have an account? Login here!</a></p>
        <br />
        <asp:Button ID="btnSubmit" class="btnSignUp" runat="server" Text="Submit" OnClick="btnSubmit_OnClick" style="font-size: 1.2rem; margin: 0; width: 100%" />

          </asp:Panel>
            <br />
            <asp:Label ID="AccountMsg" runat="server" Text=""></asp:Label>
            <br />
    </div>
</asp:Content>