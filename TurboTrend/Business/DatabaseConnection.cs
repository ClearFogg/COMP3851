using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TurboTrend.InstagramScraper;
using TurboTrend.Model;

namespace TurboTrend.Business
{
    public class DatabaseConnection
    {
        public DatabaseConnection() { }

        private void InsertInfluencerIntoDB()
        {
            ScraperConnection scraper = new ScraperConnection();
            Account[] listAcc = scraper.accList;
            DataTable dt = new DataTable();
            dt.Columns.Add("accountName");
            dt.Columns.Add("accountUrl");
            dt.Columns.Add("accountFollowers");
            dt.Columns.Add("accountFollowing");
            dt.Columns.Add("accountPosts");

            for (int i = 0; i < 5; i++)
            {
                string[] row = { listAcc[i].accountName, listAcc[i].accountUrl, listAcc[i].accountFollowers, listAcc[i].accountFollowing, listAcc[i].accountPosts };
                dt.Rows.Add(row);
            }

            grdCategories.DataSource = dt;
            grdCategories.DataBind();

            SqlConnection conn = null;
            SqlDataReader rdr = null;

            try
            {
                conn = new SqlConnection(@"Server=DESKTOP-3S0MBR6\SQLEXPRESS;DataBase=TurboTrend;Integrated Security=SSPI");

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
        }
    }
}