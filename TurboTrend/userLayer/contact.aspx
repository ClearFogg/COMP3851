<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.contact" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <h1>Contact Us</h1>
        <asp:Panel ID="SentInqiury" runat="server" Visible="false">
            <h2>Thank you!</h2>
            <br />
            <p>Your message has been sent to an administrator.</p>
            <br />
            <p>At TurboTrend, we value all of our users, and strive to provide everyone with the best possible experience.
                We aim to answer every support request and enquiry within 48 hours.</p>
            <br />
            <p>However, if you do not recieve a response within this time frame, please feel free to call 678-9998-212 or send us another request.</p>
        </asp:Panel>
        <asp:Panel ID="pageContent" runat="server">
            <h2 style="text-align: left;">Name:</h2>
            <asp:TextBox runat="server" ID="name" style="height: 30px; width:100%;" type="name"></asp:TextBox>
            <br />
            <h2 style="text-align: left;margin-top: 3%;">Email Address:</h2>
            <asp:TextBox runat="server" ID="emailAddress" style="height: 30px; width:100%;" type="email"></asp:TextBox>
            <br />
            <h2 style="text-align: left; margin-top: 3%;">Message:</h2>
            <asp:TextBox runat="server" ID="userInqury" style="margin-bottom: 1rem; height: 300px; width:100%;" TextMode="MultiLine"></asp:TextBox>
            <div>
                <asp:Button runat="server" ID="submitInquiry" text="Submit" OnClick="SubmitInquiry_Click" class="btnSignUp" style="font-size: 1.2rem; margin: 0; width: 100%"/>
            </div>
        </asp:Panel>
    </div>
</asp:Content>