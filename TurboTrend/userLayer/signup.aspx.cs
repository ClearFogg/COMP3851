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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            int errorNum = createAccount();
            if (errorNum == 0)
            {
                AccountMsg.Text = "SUCCESS!";
            }
            else if (errorNum == 1)
            {
                AccountMsg.Text = "Account with this name already exists.";
            }
            else if (errorNum == 2)
            {
                AccountMsg.Text = "Business with this name already exists.";
            }
            else
            {
                AccountMsg.Text = "Something undesirable has happened.";
            }
        }

        private int createAccount()
        {
            SqlConnection conn = null;
            int errorCode = -1;
            try
            {
                conn = new SqlConnection(@"Server=DESKTOP-UOOEQ82\SQLEXPRESS;DataBase=TurboTrend;Integrated Security=SSPI");

                using (SqlCommand cmd = new SqlCommand("sp_CreateAccountAndBusiness"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@aName", aName.Text);
                    cmd.Parameters.AddWithValue("@bName", bName.Text);
                    cmd.Parameters.AddWithValue("@pword", hashPword(pword.Text));
                    cmd.Parameters.AddWithValue("@email", email.Text);
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

        private string hashPword(string pwordToHash)
        {
            HashAlgorithm algorithm = new SHA256CryptoServiceProvider();

            Byte[] inputBytes = Encoding.UTF8.GetBytes(pwordToHash);

            Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            return BitConverter.ToString(hashedBytes);
        }

    }
}