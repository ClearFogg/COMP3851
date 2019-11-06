<%@ Page Title="" Language="C#" MasterPageFile="~/userLayer/TurboTrend.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="TurboTrend.userLayer.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <h1>Your Account</h1>
        <div>
            <h2 style="text-align: left; text-decoration: underline;">Business Name:</h2>
            <div style="margin-left: 3rem;">
                <asp:Label runat="server" ID="businessName"></asp:Label>
            </div>
        </div>
        <br />
        <div>
            <h2 style="text-align: left; text-decoration: underline;">Email Address:</h2>
            <div style="margin-left: 3rem;">
                <asp:Label runat="server" ID="accEmail"></asp:Label>
            </div>
        </div>
        <br />
        <div>
            <h2 style="text-align: left;">Change Password:</h2>
            <div style="margin-left: 3rem;">
                <asp:Button runat="server" ID="changePasswordButton" OnClick="changePasswordButton_Click" class="btnPwReset" Text="Reset Now" />
            </div>
        </div>
    </div>
</asp:Content>
