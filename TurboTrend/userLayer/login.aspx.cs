using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TurboTrend.userLayer
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            LoginMsg.Text = "";
            string businessName = verifyLogin();
            if (businessName != null)
            {
                Session["businessName"] = businessName;
                Response.Redirect("index.aspx");
            }
        }

        private string verifyLogin()
        {
            SqlConnection conn = null;
            conn = new SqlConnection((new ProjectConfig().DBConnectionString));
            int errorCode = -1;
            string businessName = null;
            using (SqlCommand cmd = new SqlCommand("sp_verifyLogin"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@aName", usernameBox.Text);
                cmd.Parameters.AddWithValue("@pword", hashPword(passwordBox.Text));
                cmd.Parameters.AddWithValue("@errorCode", errorCode);
                var returnParameter = cmd.Parameters.Add("@errorCode", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                conn.Open();
                businessName = (string)cmd.ExecuteScalar();
                errorCode = Convert.ToInt32(returnParameter.Value);
                conn.Close();
            }
            if (errorCode == 1)
            {
                LoginMsg.Text = "Account with this name does not exist.";
            }
            else if (errorCode == 2)
            {
                LoginMsg.Text = "Password is incorrect.";
            }
            return businessName;
        }

        private string hashPword(string pwordToHash)
        {
            HashAlgorithm algorithm = new SHA256CryptoServiceProvider();

            Byte[] inputBytes = Encoding.UTF8.GetBytes(pwordToHash);

            Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            return BitConverter.ToString(hashedBytes);
        }
    }
}