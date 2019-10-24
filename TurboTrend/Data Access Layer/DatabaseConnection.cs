using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TurboTrend.InstagramScraper;
using TurboTrend.Model;

namespace TurboTrend.Business
{
    public class DatabaseConnection
    {
        public DatabaseConnection() { }

        private void InsertHashtagIntoDB(string input)
        {
            SqlConnection conn = null;
            conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            using (SqlCommand cmd = new SqlCommand("sp_InsertHashtag"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@hashtagtxt", input);
                cmd.Parameters.AddWithValue("@businessName", HttpContext.Current.Session["businessName"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        public DataTable InsertInfluencerIntoDB(Account[] listAcc)
        {
            //ScraperConnection scraper = new ScraperConnection();
            //Account[] listAcc = scraper.accList;
            DataTable dt = new DataTable();
            dt.Columns.Add("accountName");
            dt.Columns.Add("accountUrl");
            dt.Columns.Add("accountFollowers");
            dt.Columns.Add("accountFollowing");
            dt.Columns.Add("accountPosts");
            dt.Columns.Add("engagementRate");
            dt.Columns.Add("estatimatedCostPerPost");
            dt.Columns.Add("totalPostLast60Days");

            


            for (int i = 0; i < 5; i++)// 5 is a temp number, web page needs to be coded to allow for more results?
            {
                DataRow dataRow = dt.NewRow();
                dataRow[0] = listAcc[i].accountName;
                dataRow[1] = listAcc[i].accountUrl;
                dataRow[2] = listAcc[i].accountFollowers;
                dataRow[3] = listAcc[i].accountFollowing;
                dataRow[4] = listAcc[i].accountPosts;
                dataRow[5] = 99; // Engagement Rate
                dataRow[6] = 10; //Cost per post
                dataRow[7] = 10; // Posts last 60 days
            }

            //grdCategories.DataSource = dt;
            //grdCategories.DataBind();

            SqlConnection conn = null;
            SqlDataReader rdr = null;

            try
            {
                conn = new SqlConnection((new ProjectConfig().DBConnectionString));

                using (SqlCommand cmd = new SqlCommand("sp_UpdateInsertInfluencer"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@tblInfluencer", dt);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            //Checking if connection is still open, closing if it is.
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
                if (rdr != null)
                {
                    rdr.Close();
                }
                
            }

            return dt;
        }
    }
}