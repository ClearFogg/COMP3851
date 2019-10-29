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
using TurboTrend.Business_Layer;

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

            AccountManager loginManager = new AccountManager();
            int iAccountCode = loginManager.loginAccount(usernameBox.Text, passwordBox.Text);

            switch (iAccountCode)
            {
                case 1:
                    LoginMsg.Text = "Account with this name does not exist.";
                    break;
                case 2:
                    LoginMsg.Text = "Password is incorrect";
                    break;
                default:
                    Session["businessName"] = usernameBox.Text;
                    Response.Redirect("~/userLayer/index.aspx");
                    break;
            }
            
        }
    }
}