using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurboTrend.InstagramScraper;
using TurboTrend.Model;

namespace TurboTrend.userLayer
{
    public partial class match : System.Web.UI.Page
    {
        SearchParameters sP = new SearchParameters();
        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
           }
        }*/



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            btnSearch.Enabled = false;

            ScraperConnection scraper = new ScraperConnection();
            DataTable dTable = scraper.interpretHashTagAndSearch(hashtag.Text);

            for (int i = dTable.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dTable.Rows[i];

                if (Convert.ToDouble(dr["engagementRate"]) > Convert.ToDouble(engagementRateFilter.SelectedValue))
                {
                    dr.Delete();
                }
                else if (Convert.ToInt32(dr["accountFollowers"]) < Convert.ToInt32(followersMin.Text) || Convert.ToInt32(dr["accountFollowers"]) > Convert.ToInt32(followersMax.Text))
                {
                    dr.Delete();
                }
                else if (Convert.ToInt32(dr["totalPostLast60Days"]) < Convert.ToInt32(totalPostPast60Days.SelectedValue))
                {
                    dr.Delete();
                }
                else if (Convert.ToInt32(dr["estimatedCostPerPost"]) < Convert.ToInt32(costPerPost.SelectedValue))
                {
                    dr.Delete();
                }
            }
            dTable.AcceptChanges();

            grdCategories.DataSource = dTable;
            grdCategories.DataBind();

            btnSearch.Enabled = true;

        }

        protected void followersMin_TextChanged(object sender, EventArgs e)
        {
            engagementRateFilter.SelectedIndex = 0;
            costPerPost.SelectedIndex = 0;
            totalPostPast60Days.SelectedIndex = 0;
        }

        protected void followersMax_TextChanged(object sender, EventArgs e)
        {
            engagementRateFilter.SelectedIndex = 0;
            costPerPost.SelectedIndex = 0;
            totalPostPast60Days.SelectedIndex = 0;
        }

        protected void engagementRateFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            costPerPost.SelectedIndex = 0;
            totalPostPast60Days.SelectedIndex = 0;
            followersMin.Text = "0";
            followersMax.Text = "";
        }

        protected void costPerPost_SelectedIndexChanged(object sender, EventArgs e)
        {
            engagementRateFilter.SelectedIndex = 0;
            totalPostPast60Days.SelectedIndex = 0;
            followersMin.Text = "0";
            followersMax.Text = "";
        }

        protected void totalPostPast60Days_SelectedIndexChanged(object sender, EventArgs e)
        {
            costPerPost.SelectedIndex = 0;
            engagementRateFilter.SelectedIndex = 0;
            followersMin.Text = "0";
            followersMax.Text = "";
        }
    }
}