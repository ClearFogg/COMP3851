<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.index" %>

<asp:Content ID="home" ContentPlaceHolderID="mainContent" runat="server">
<div class="mainGrid" style="padding:1%;">
    <div class="topRow">
        <div style="background-image: url(media/cactusCam.jpg); background-position: center; width: auto; grid-column-start: 1; grid-column-end: 3; background-size: cover;"> <!-- Photo by Aldo Delara on Unsplash - https://unsplash.com/photos/3492xjtoGcg?fbclid=IwAR3lJPfA5bR2ARLBckq9KqeKyF8pResSGUmrxh7paciwrkl8XLts6yZcOTo -->
            <p class="homeText">About</p>
        </div>
        <div style="background-image: url(media/insta.jpg); background-position: center; width: auto; background-size: cover;"> <!-- Photo by Luke van Zyl on Unsplash - https://unsplash.com/photos/Fs1hfkNOGsQ -->
            <p class="homeText">Why TurboTrend?</p>
        </div>
    </div>
    <div style="clear: both; margin-top: 1%;"></div>
    <div class="bottomRow">
        <div style="background-image: url(media/instaStickers.jpg); background-position: center; width: auto; background-size: cover;"> <!-- Photo by Alex Holyoake on Unsplash - https://unsplash.com/photos/5U4sMpaJ78M-->
            <p class="homeText">What We Do</p>
        </div>
        <div style="background-image: url(media/desktopPic.jpg); background-position: center; width: auto; background-size: cover;"> <!-- Photo by Ben Kolde on Unsplash - https://unsplash.com/photos/KukKYcxGOwU -->
            <p class="homeText">Who Are We?</p>
        </div>
        <div style="background-image: url(media/begin.jpg); background-position: center; width: auto; background-size: cover;"> <!-- Photo by Danielle MacInnes on Unsplash - https://unsplash.com/photos/IuLgi9PWETU?fbclid=IwAR21WlXhbzlelMrvU_waCsYgFnuTuv7BdwrUTtc5rKjE1QJf09BE_9PaAXg -->
            <p class="homeText">Start Now</p>
        </div>
    </div>
</div>
</asp:Content>