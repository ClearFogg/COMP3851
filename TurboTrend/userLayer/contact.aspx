<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.contact" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="SentInqiury" runat="server" Visible="false" CssClass="mainGrid">
        <h2>Your support inquiry has been sent to an administrator. <br />We strive to deal with every support request within 48 hours <br />If you do not recieve a response in 48 hours, please feel free to call 6789998212.</h2>
    </asp:Panel>
    <asp:Panel ID="pageContent" runat="server" CssClass="mainGrid">
        <asp:TextBox runat="server" ID="emailAddress" style="height: 30px;" type="email"></asp:TextBox>
        <br />
        <asp:TextBox runat="server" ID="userInqury" style="margin-top: 1rem; margin-bottom: 1rem; height: 500px;" TextMode="MultiLine"></asp:TextBox>
        <br />
        <div>
            <asp:Button runat="server" ID="submitInquiry" style="float:right;" text="Submit" OnClick="SubmitInquiry_Click"/>
        </div>
    </asp:Panel>
</asp:Content>