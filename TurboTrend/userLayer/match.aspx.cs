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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["businessName"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        private void InsertHashtagIntoDB(string input)
        {
            SqlConnection conn = null;
            conn = new SqlConnection(@"Server=DESKTOP-3S0MBR6\SQLEXPRESS;DataBase=TurboTrend;Integrated Security=SSPI");
            using (SqlCommand cmd = new SqlCommand("sp_InsertHashtag"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@hashtagtxt", input);
                cmd.Parameters.AddWithValue("@businessName", Session["businessName"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ScraperConnection scraper = new ScraperConnection();
            scraper.interpretHashTagAndSearch(hashtag.Text);


            InsertHashtagIntoDB(hashtag.Text);
            InsertInfluencerIntoDB();
        }


    }
}