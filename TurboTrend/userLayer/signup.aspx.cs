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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If the user is already logged in, they're unable to register a new account..?
            if (!string.IsNullOrEmpty((string)Session["businessName"]))
            {
                pageContent.Visible = false;
                pageContent.Enabled = false;
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            AccountManager accMgr = new AccountManager();

            int iAccountStatus = accMgr.createAccount(aName.Text, pword.Text, bName.Text, email.Text);

            switch (iAccountStatus)
            {
                case 0:
                    AccountMsg.Text = "SUCCESS!";
                    // Hides all onscreen elements
                    pageContent.Visible = false;
                    pageContent.Enabled = false;

                    Session["businessName"] = bName;

                    break;
                case 1:
                    AccountMsg.Text = "Account with this name already exists.";
                    break;
                case 2:
                    AccountMsg.Text = "Business with this name already exists.";
                    break;
                default:
                    AccountMsg.Text = "Something undesirable has happened.";
                    break;
            }
        }
    }
}