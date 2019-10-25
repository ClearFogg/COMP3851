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
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" class="btnSignUp" Text="Search" style="float:right; margin-right:5%; color:white; margin-top: 2%;"/>
            </asp:Panel>
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
                            </Columns>
                            <AlternatingRowStyle CssClass="altRow" />
                        </asp:GridView>
					</div>
					<div class="heroContainer heroWrap"></div>
					<div class="heroContainer heroWrap"></div>
				</div>
			</div>

</asp:Content>
    

