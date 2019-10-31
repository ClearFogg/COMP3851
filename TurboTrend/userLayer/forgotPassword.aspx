<%@ Page Title="" Language="C#" MasterPageFile="~/userLayer/TurboTrend.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="TurboTrend.userLayer.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="ForgotPassword" runat="server" CssClass="mainGrid">
        <h1>Forgot Password</h1>
        <br />
        <div>
            <h2>Email:</h2>
            <asp:TextBox ID="emailBox" runat="server" placeholder="Email Address" CssClass="textBox" style="margin-bottom: 2rem;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="emailBox"  Display="Dynamic" ErrorMessage="<br /><br />An email address is required." ></asp:RequiredFieldValidator>
        </div>
        <br />
        <asp:Button ID="forgotPwd" CssClass="btnSignUp" runat="server" Text="Send Reset Link" OnClick="submitButton_Click" />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel id="goodMessage" runat="server" CssClass="mainGrid" Visible="false">
        <asp:Label ID="passswordChanged" runat="server" Text="<H2>Your password has been changed<h2/>"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="ChangePassword" runat="server" CssClass="mainGrid">
        <h1>Change Password</h1>
        <br />
        <div>
            <h3>New Password</h3>
            <asp:TextBox ID="NewPassword" runat="server" CssClass="textBox"></asp:TextBox>
            <br />
        </div>
        <div>
            <h3>Confirm New Password</h3>
            <asp:TextBox ID="confirmPassword" runat="server" CssClass="textBox"></asp:TextBox>
            <br />
        </div>
        <div>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="required" ControlToValidate="NewPassword" ErrorMessage="Please enter a new password<br />"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" Display="Dynamic" ID="makeSureSame" ErrorMessage="You have not entered the same password" ControlToValidate="NewPassword" ControlToCompare="confirmPassword" Type="String" Operator="Equal"></asp:CompareValidator>
        </div>
        <br />
        <asp:Button ID="SubmitNewPW" runat="server" CssClass="btnSignUp" OnClick="SubmitNewPW_Click" Text="Change Password" />
    </asp:Panel>
</asp:Content>
