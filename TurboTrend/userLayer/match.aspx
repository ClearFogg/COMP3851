<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="match.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.match" %>

<asp:Content ID="match" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Label ID="outputInfo" runat="server"></asp:Label>
    <asp:PlaceHolder ID="searchContent" runat="server"></asp:PlaceHolder>
        <div class="mainGrid">
    	    <h1>Find Your Match</h1>
                    <p style="text-align:center">Enter up to three hashtags (separated by commas) and set your search parameters.</p>
            <asp:Panel runat="server" CssClass="centerAlign">
            <asp:TextBox ID="hashtag" runat="server" placeholder="Search" autocomplete="off" class="textBox"></asp:TextBox>
            <br />
                <div style="margin-top: 3%; width: 90%;">
                <!--Insert checkboxes/sliders/inputs for search parameters here.-->
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
            <asp:Label ID="lblEngagementRate" runat="server" Text="Filter by Engagement Rate"></asp:Label>
            <asp:DropDownList ID="engagementRateFilter" OnSelectedIndexChanged="engagementRateFilter_SelectedIndexChanged" AutoPostBack="true" runat="server">
                <asp:ListItem Enabled="true" Text="Filter engagement rate..." Value="100"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 2.5" Value="2.5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 5" Value="5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 7.5" Value="7.5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 10" Value="10"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblCostPerPost" runat="server" Text="Filter by Cost Per Post"></asp:Label>
            <asp:DropDownList ID="costPerPost" OnSelectedIndexChanged="costPerPost_SelectedIndexChanged" AutoPostBack="true" runat="server">
                <asp:ListItem Enabled="true" Text="Filter cost per post..." Value="0"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $100" Value="100"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $500" Value="500"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $1000" Value="1000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $1500" Value="1500"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblTotalFollowers" runat="server" Text="Filter by Total Followers"></asp:Label>
            Min: <asp:TextBox ID="followersMin" Text="0" OnTextChanged="followersMin_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox> Max: <asp:TextBox ID="followersMax" OnTextChanged="followersMax_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
            <asp:Label ID="lbltotalPostPast60Days" runat="server" Text="Filter by Total Posts Past 60 Days"></asp:Label>
            <asp:DropDownList ID="totalPostPast60Days" OnSelectedIndexChanged="totalPostPast60Days_SelectedIndexChanged" AutoPostBack="true" runat="server">
                <asp:ListItem Enabled="true" Text="Filter total posts past 60 days..." Value="0"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 5" Value="5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 10" Value="10"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 25" Value="25"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 50" Value="50"></asp:ListItem>
            </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                <br />
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" class="btnSignUp" Text="Search" style="font-size: 1.2rem; margin: 0; width: 100%;"/>
            </asp:Panel>
            <!--It would be great to have this bit appear after the search button is hit. I'm not entirely sure how so with time
                constraints, we could create a new page to house it all if necessary.-->
                <!-- Update panel to keep changes made to items only update inside of here, rather than refresh page. -->
                    <div style="overflow: auto;">
                       <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:HyperLinkField 
                                    DataNavigateUrlFields="accountName"
                                    DataNavigateUrlFormatString="/userLayer/redirectAcc.aspx?account={0}"
                                    DataTextField="accountName" />
                                <asp:TemplateField HeaderText="Account Followers">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ImagePath" runat="server" Text='<%#Eval("accountFollowers") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Following">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ShortDescription" runat="server" Text='<%#Eval("accountFollowing") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Posts">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("accountPosts")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Engagement Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("engagementRate")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estimated Cost Per Post">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("estimatedCostPerPost")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Posts Last 60 Days">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("totalPostLast60Days")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <AlternatingRowStyle CssClass="altRow" />
                        </asp:GridView>
                    </div>
    </div>
</asp:Content>
    

