using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TurboTrend.Model;

namespace TurboTrend.Business
{
    public class DatabaseConnection
    {
        public DatabaseConnection() { }

        public string getEmailFromBusinessName(string businessName)
        {
            string sReturnedValue = "";

            SqlConnection conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            using (SqlCommand cmd = new SqlCommand("sp_ChangeUserPassword"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@accountName", businessName);
                conn.Open();

                sReturnedValue = (string)cmd.ExecuteScalar();

                conn.Close();
            }

            return sReturnedValue;
        }

        public int changePassword(string sPassword, string sEmail)
        {
            int iReturnCode = 0;

            SqlConnection conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            using (SqlCommand cmd = new SqlCommand("sp_ChangeUserPassword"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Email", sEmail);
                cmd.Parameters.AddWithValue("@NewPword", sPassword);
                cmd.Parameters.AddWithValue("@returnCode", iReturnCode);
                var returnParameter = cmd.Parameters.Add("@returnCode", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                conn.Open();
                cmd.ExecuteNonQuery();
                iReturnCode = Convert.ToInt32(returnParameter.Value);
                conn.Close();
            }

            return iReturnCode;
        }

        public int createAccount(string sName, string sBusinessName, string sPassword, string sEmail, string sPhone, string sIndustry)
        {
            SqlConnection conn = null;
            int errorCode = -1;
            try
            {
                conn = new SqlConnection((new ProjectConfig().DBConnectionString));

                using (SqlCommand cmd = new SqlCommand("sp_CreateAccountAndBusiness"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@aName", sName);
                    cmd.Parameters.AddWithValue("@bName", sBusinessName);
                    cmd.Parameters.AddWithValue("@pword", sPassword);
                    cmd.Parameters.AddWithValue("@email", sEmail);
                    cmd.Parameters.AddWithValue("@phone", sPhone);
                    cmd.Parameters.AddWithValue("@industry", sIndustry);
                    cmd.Parameters.AddWithValue("@errorCode", errorCode);
                    var returnParameter = cmd.Parameters.Add("@errorCode", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = Convert.ToInt32(returnParameter.Value);
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
            }

            return errorCode;
        }

        public int loginUser(string sUsername, string sPassword)
        {
            int iReturnValue = -1;

            SqlConnection conn = null;
            conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            using (SqlCommand cmd = new SqlCommand("sp_verifyLogin"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@aName", sUsername);
                cmd.Parameters.AddWithValue("@pword", sPassword);
                cmd.Parameters.AddWithValue("@errorCode", iReturnValue);
                var returnParameter = cmd.Parameters.Add("@errorCode", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                conn.Open();

                cmd.ExecuteScalar();
                iReturnValue = Convert.ToInt32(returnParameter.Value);
                conn.Close();
            }

            return iReturnValue;
        }

        public void InsertHashtagIntoDB(string input)
        {
            SqlConnection conn = null;
            conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            using (SqlCommand cmd = new SqlCommand("sp_InsertHashtag"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@hashtagtxt", input);
                cmd.Parameters.AddWithValue("@username", HttpContext.Current.Session["username"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        private DataTable createDataTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("accountName");
            dt.Columns.Add("accountUrl");
            dt.Columns.Add("accountFollowers");
            dt.Columns.Add("accountFollowing");
            dt.Columns.Add("accountPosts");
            dt.Columns.Add("engagementRate");
            dt.Columns.Add("estimatedCostPerPost");
            dt.Columns.Add("totalPostLast60Days");
            return dt;
        }

        public DataTable InsertInfluencerIntoDB(Account[] listAcc)
        {
            //ScraperConnection scraper = new ScraperConnection();
            //Account[] listAcc = scraper.accList;
            DataTable dt = createDataTable();          


            for (int i = 0; i < listAcc.Length; i++)
            {
                DataTable tempTable = createDataTable();

                DataRow dataRow = tempTable.NewRow();
                dataRow[0] = listAcc[i].accountName;
                dataRow[1] = listAcc[i].accountUrl;
                dataRow[2] = listAcc[i].accountFollowers;
                dataRow[3] = listAcc[i].accountFollowing;
                dataRow[4] = listAcc[i].accountPosts;
                dataRow[5] = 99; // Engagement Rate, talk to Jeremy
                dataRow[6] = Math.Round(int.Parse(listAcc[i].accountFollowers) * 0.0005); // Cost per post
                dataRow[7] = 10; // Posts last 60 days
                tempTable.Rows.Add(dataRow);

                dt.ImportRow(tempTable.Rows[0]);


                SqlConnection conn = new SqlConnection((new ProjectConfig().DBConnectionString));

                try
                {
                    using (SqlCommand cmd = new SqlCommand("sp_UpdateInsertInfluencer"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = conn;
                        cmd.Parameters.AddWithValue("@tblInfluencer", tempTable);
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
                }
            }



            return dt;
        }
    }
}