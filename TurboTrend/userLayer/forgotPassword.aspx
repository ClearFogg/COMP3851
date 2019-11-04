<%@ Page Title="" Language="C#" MasterPageFile="~/userLayer/TurboTrend.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="TurboTrend.userLayer.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="ForgotPassword" runat="server" CssClass="mainGrid">
        <h1>Forgot Password</h1>
        <br />
        <div>
            <h2 style="text-align: left;">Email Address:</h2>
            <asp:TextBox ID="emailBox" runat="server" placeholder="Email Address" class="textBox" style="margin-bottom: 1rem;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="emailBox"  Display="Dynamic" ErrorMessage="<p style='color: red;'>Please enter your email address.</p>"></asp:RequiredFieldValidator>
        </div>
        <br />
        <asp:Button ID="forgotPwd" CssClass="btnSignUp" runat="server" Text="Send Password Reset Link" OnClick="submitButton_Click" style="font-size: 1.2rem; margin: 0; width: 100%" />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel id="goodMessage" runat="server" CssClass="mainGrid" Visible="false">
        <asp:Label ID="passswordChanged" runat="server" Text="<h2>Your password has been changed successfully.</h2>"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="ChangePassword" runat="server" CssClass="mainGrid">
        <h1>Change Password</h1>
        <br />
        <div>
            <h2>New Password</h2>
            <asp:TextBox ID="NewPassword" runat="server" CssClass="textBox"></asp:TextBox>
            <br />
        </div>
        <div>
            <h2>Confirm New Password</h2>
            <asp:TextBox ID="confirmPassword" runat="server" CssClass="textBox"></asp:TextBox>
            <br />
        </div>
        <div>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="required" ControlToValidate="NewPassword" ErrorMessage="Please enter a new password.<br />"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" Display="Dynamic" ID="makeSureSame" ErrorMessage="Passwords do not match." ControlToValidate="NewPassword" ControlToCompare="confirmPassword" Type="String" Operator="Equal"></asp:CompareValidator>
        </div>
        <br />
        <asp:Button ID="SubmitNewPW" runat="server" CssClass="btnSignUp" OnClick="SubmitNewPW_Click" Text="Change Password" style="font-size: 1.2rem; margin: 0; width: 100%"/>
    </asp:Panel>
</asp:Content>
