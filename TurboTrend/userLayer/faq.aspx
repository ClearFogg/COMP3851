<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faq.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.index" %>

<asp:Content ID="faq" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainGrid">
        <!-- Code for collapsible content adapted from https://www.w3schools.com/howto/howto_js_collapsible.asp -->
        <h1>Frequently Asked Questions</h1>
        <div class="collapsible">Why should businesses look to TurboTrend to find potential influencers for their products and services?</div>
        <div class="faq">
            <p>TurboTrend specialises in finding the right match for a business by allowing searching of up to 3 personalised hashtags and matching those with the top 5 most popular Instagram influencers for each.</p>
        </div>

        <div class="collapsible" id="whatDoesTTDo">In simple terms, what does TurboTrend do? </div>
        <div class="faq">
            <p>TurboTrend aims to connect businesses with potential influencers on the Instagram platform by finding a match both in terms of content and price.</p>
        </div>

        <div class="collapsible">What does TurboTrend do differently to other services?</div>
        <div class="faq">
            <p>TurboTrend utilises a calculation of total followers, likes and comments to generate an ‘engagement rate’ as a percentage to display how engaged an influencer’s follower base is.</p>
        </div>

        <div class="collapsible">How effective is social media marketing on a teenage audience?</div>
        <div class="faq">
            <p>It is very effective. 70% of teens trust social media influencers more than they do traditional celebrities and 60% of teens follow advice from influencers over celebrities also.</p>
        </div>


        <div class="collapsible">Does social media marketing impact purchase decisions?</div>
        <div class="faq">
            <p>86% of women use social media for purchasing advice and 49% of consumers depend on influencer recommendations.</p>
        </div>

        <div class="collapsible">How much can a business expect to earn from social media marketing?</div>
        <div class="faq">
            <p>On average, influencer marketing campaigns earn $6.50 for every dollar spent, but this may vary depending on the specifics of your agreement and the popularity of the influencer you choose.</p>
        </div>

        <div class="collapsible">What is the average spend of a business marketer?</div>
        <div class="faq">
            <p>Marketers, on average spend between $25 000 and $50 000 on multifacted influencer marketing campaigns.</p>
        </div>

        <div class="collapsible">Do people trust social media services for advice?</div>
        <div class="faq">
            <p>74% of people trust social networks to guide purchasing decisions.</p>
        </div>
    </div>
        <script type="text/javascript">
            var col = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < col.length; i++) {
                col[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var faq = this.nextElementSibling;

                    if (faq.style.maxHeight) {
                        faq.style.maxHeight = null;
                    }
                    else {
                        faq.style.maxHeight = faq.scrollHeight + "%";
                    } 
                });
            }
        </script>
</asp:Content>