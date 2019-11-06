<%@ Page Title="" Language="C#" MasterPageFile="~/userLayer/TurboTrend.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="TurboTrend.userLayer.account" %>
<asp:Content ID="account" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <h1>Your Account</h1>
        <div>
            <h2 style="text-align: left;">Business Name:</h2>
            <div>
                <asp:Label runat="server" ID="businessName"></asp:Label>
            </div>
        </div>
        <br />
        <div>
            <h2 style="text-align: left;">Email Address:</h2>
            <div>
                <asp:Label runat="server" ID="accEmail"></asp:Label>
            </div>
        </div>
        <br />
        <div>
            <h2 style="text-align: left;">Change Password:</h2>
            <div>
                <asp:Button runat="server" ID="changePasswordButton" OnClick="changePasswordButton_Click" class="btnPwReset" Text="Reset Now" />
            </div>
        </div>
    </div>
</asp:Content>
