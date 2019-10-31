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
            <asp:Label ID="lblEngagementRate" runat="server" Text="Filter by Engagement Rate"></asp:Label>
            <asp:DropDownList ID="engagementRateFilter" runat="server">
                <asp:ListItem Enabled="true" Text="Filter engagement rate..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 25" Value="25"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 50" Value="50"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 75" Value="75"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> 90" Value="90"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblCostPerPost" runat="server" Text="Filter by Cost Per Post"></asp:Label>
            <asp:DropDownList ID="costPerPost" runat="server">
                <asp:ListItem Enabled="true" Text="Filter cost per post..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $100" Value="100"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $500" Value="500"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $1000" Value="1000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="> $1500" Value="1500"></asp:ListItem>
            </asp:DropDownList>
                    </div>
                <br />
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" class="btnSignUp" Text="Search" style="font-size: 1.2rem; margin: 0; width: 100%;"/>
            </asp:Panel>
            <!--It would be great to have this bit appear after the search button is hit. I'm not entirely sure how so with time
                constraints, we could create a new page to house it all if necessary.-->
                <!-- Update panel to keep changes made to items only update inside of here, rather than refresh page. -->
                       <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:TemplateField HeaderText="Account Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_accName" runat="server" Text='<%#Eval("accountName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Url">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_accURL" runat="server" Text='<%#Eval("accountUrl") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
</asp:Content>
    

