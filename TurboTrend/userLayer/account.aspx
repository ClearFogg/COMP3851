<%@ Page Title="" Language="C#" MasterPageFile="~/userLayer/TurboTrend.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="TurboTrend.userLayer.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <div>
            <h3>Business Name</h3>
            <asp:Label runat="server" ID="businessName"></asp:Label>
        </div>
        <div>
            <h3>Account Email</h3>
            <asp:Label runat="server" ID="accEmail"></asp:Label>
        </div>
        <div>
            <h3>Change Password</h3>
            <asp:Button runat="server" ID="changePasswordButton" OnClick="changePasswordButton_Click" />
        </div>
    </div>
</asp:Content>
