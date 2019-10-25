using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurboTrend.Business;
using TurboTrend.InstagramScraper;
using TurboTrend.Model;

namespace TurboTrend.userLayer
{
    public partial class match : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["businessName"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ScraperConnection scraper = new ScraperConnection();
            DatabaseConnection db = new DatabaseConnection();
            scraper.interpretHashTagAndSearch(hashtag.Text);
            db.InsertInfluencerIntoDB();
            db.InsertHashtagIntoDB(hashtag.Text, Session["businessName"].ToString());

        }


    }
}