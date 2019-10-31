<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.contact" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
    <h1>Contact Us</h1>
    <asp:Panel ID="SentInqiury" runat="server" Visible="false">

        <h2>Your support inquiry has been sent to an administrator. <br />We strive to deal with every support request within 48 hours <br />If you do not recieve a response in 48 hours, please feel free to call 6789998212.</h2>
    </asp:Panel>
    <asp:Panel ID="pageContent" runat="server">
        <h2 style="text-align: left;">Name:</h2>
        <asp:TextBox runat="server" ID="name" style="height: 30px; width:100%;" type="name"></asp:TextBox>
        <br />
        <h2 style="text-align: left;margin-top: 3%;">Email Address:</h2>
        <asp:TextBox runat="server" ID="emailAddress" style="height: 30px; width:100%;" type="email"></asp:TextBox>
        <br />
        <h2 style="text-align: left; margin-top: 3%;">Message:</h2>
        <asp:TextBox runat="server" ID="userInqury" style="margin-bottom: 1rem; height: 500px; width:100%;" TextMode="MultiLine"></asp:TextBox>
        <div>
            <asp:Button runat="server" ID="submitInquiry" text="Submit" OnClick="SubmitInquiry_Click" class="btnSignUp" style="font-size: 1.2rem; margin: 0; width: 100%"/>
        </div>
    </asp:Panel>
        </div>
</asp:Content>