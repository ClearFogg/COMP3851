<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.index" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
<div class="mainGrid" style="padding:1%;">
    <div class="topRow">
        <div class="homeImageGridDesktop" style="background-image: url(media/cactusCam.jpg);"> <!-- Photo by Aldo Delara on Unsplash - https://unsplash.com/photos/3492xjtoGcg?fbclid=IwAR3lJPfA5bR2ARLBckq9KqeKyF8pResSGUmrxh7paciwrkl8XLts6yZcOTo -->
            <p class="homeText"><a href="about.aspx" style="text-decoration: none;">About</a></p>
        </div>
        <div class="homeImageGrid" style="background-image: url(media/insta.jpg);"> <!-- Photo by Luke van Zyl on Unsplash - https://unsplash.com/photos/Fs1hfkNOGsQ -->
            <p class="homeText"><a href="features.aspx" style="text-decoration: none;">Why TurboTrend?</a></p>
        </div>
    </div>
    <div style="clear: both; margin-top: 1%;"></div>
    <div class="bottomRow">
        <div class="homeImageGrid" style="background-image: url(media/instaStickers.jpg);" > <!-- Photo by Alex Holyoake on Unsplash - https://unsplash.com/photos/5U4sMpaJ78M-->
            <p class="homeText"><a href="faq.aspx#whatDoesTTDo" style="text-decoration: none;">What We Do</a></p>
        </div>
        <div class="homeImageGrid" style="background-image: url(media/desktopPic.jpg);"> <!-- Photo by Ben Kolde on Unsplash - https://unsplash.com/photos/KukKYcxGOwU -->
            <p class="homeText"><a href="contact.aspx" style="text-decoration: none;">Who Are We?</a></p>
        </div>
        <div class="homeImageGrid" style="background-image: url(media/begin.jpg);"> <!-- Photo by Danielle MacInnes on Unsplash - https://unsplash.com/photos/IuLgi9PWETU?fbclid=IwAR21WlXhbzlelMrvU_waCsYgFnuTuv7BdwrUTtc5rKjE1QJf09BE_9PaAXg -->
            <p class="homeText"><a href="signup.aspx" style="text-decoration: none;">Start Now</a></p>
        </div>
    </div>
</div>
</asp:Content>