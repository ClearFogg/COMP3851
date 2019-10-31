<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="match.aspx.cs" MasterPageFile="TurboTrend.Master" Inherits="TurboTrend.userLayer.match" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Label ID="outputInfo" runat="server"></asp:Label>
    <asp:PlaceHolder ID="searchContent" runat="server"></asp:PlaceHolder>
        <div class="heroSection">
		    <div class="heroRow">
			    <div class="heroContainer heroWrap">
				    <h1>Find Your Match</h1>
                    <p style="text-align:center">Enter up to three hashtags (separated by commas) and set your search parameters.</p>
                    <br />
                </div>
			<div class="heroContainer heroWrap">
            <asp:Panel runat="server" CssClass="centerAlign">
            <asp:TextBox ID="hashtag" runat="server" placeholder="Search" autocomplete="off" class="form-control" style="width: 90%; margin-left:5%; margin-right:5%;"></asp:TextBox>
            <!--Insert checkboxes/sliders/inputs for search parameters here.-->
            <div>
                <div>
                <asp:Label ID="lblEngagementRate" runat="server" Text="Filter by Engagement Rate"></asp:Label>
            <asp:DropDownList ID="engagementRateFilter" runat="server">
                <asp:ListItem Enabled="true" Text="Filter engagement rate..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 2.5%" Value="2.5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 5%" Value="5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 7.5%" Value="7.5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 10%" Value="10"></asp:ListItem>
            </asp:DropDownList>
                    </div>
                <div>
            <asp:Label ID="lblCostPerPost" runat="server" Text="Filter by Cost Per Post"></asp:Label>
            <asp:DropDownList ID="costPerPost" runat="server">
                <asp:ListItem Enabled="true" Text="Filter cost per post..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< $100" Value="100"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< $500" Value="500"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< $1000" Value="1000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< $1500" Value="1500"></asp:ListItem>
            </asp:DropDownList>
                    </div>
            <asp:Label ID="lblTotalFollowers" runat="server" Text="Filter by Total Followers"></asp:Label>
            <asp:DropDownList ID="totalFollowers" runat="server">
                <asp:ListItem Enabled="true" Text="Filter total followers..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 1k" Value="1000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 10k" Value="10000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 100k" Value="100000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 500k" Value="500000"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 1m" Value="1000000"></asp:ListItem>
            </asp:DropDownList>
                    </div>
            <asp:Label ID="totalPost60Days" runat="server" Text="Filter by total posts past 60 days"></asp:Label>
            <asp:DropDownList ID="totalPost60days" runat="server">
                <asp:ListItem Enabled="true" Text="Filter cost per post..." Value="-1"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 5" Value="5"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 10" Value="10"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 20" Value="20"></asp:ListItem>
                <asp:ListItem Enabled="true" Text="< 50" Value="50"></asp:ListItem>
            </asp:DropDownList>
                </asp:Panel>
                    </div>
                </div>
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" class="btnSignUp" Text="Search" style="float:right; margin-right:5%; color:white; margin-top: 2%;"/>
			</div>
		</div>
            <!--It would be great to have this bit appear after the search button is hit. I'm not entirely sure how so with time
                constraints, we could create a new page to house it all if necessary.-->
				<div class="heroRow">
					<div class="heroContainer heroWrap">
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
					<div class="heroContainer heroWrap"></div>
					<div class="heroContainer heroWrap"></div>
				</div>
			</div>

</asp:Content>
    

