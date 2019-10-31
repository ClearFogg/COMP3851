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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
           }
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            btnSearch.Enabled = false;

            sP.engagementRate = Convert.ToDouble(engagementRateFilter.SelectedValue);

            ScraperConnection scraper = new ScraperConnection();
            DataTable dTable = scraper.interpretHashTagAndSearch(hashtag.Text);

            for (int i = dTable.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dTable.Rows[i];

                if (Convert.ToDouble(dr["engagementRate"]) > sP.engagementRate)
                {
                    dr.Delete();
                }
            }
            dTable.AcceptChanges();

            grdCategories.DataSource = dTable;
            grdCategories.DataBind();

            btnSearch.Enabled = true;

        }


    }
}