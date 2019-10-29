using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurboTrend.Business_Layer;

namespace TurboTrend.userLayer
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool hideEverythingElse = true;
            if (Request.QueryString["Key"] != null && Request.QueryString["Email"] != null)
            {
                // Validating that the key given is the key that would be generated from this email address
                EmailManager email = new EmailManager();
                if(email.checkKey(Request.QueryString["Email"], Request.QueryString["Key"]))
                {
                    hideEverythingElse = false;
                }
            }

            if (hideEverythingElse)
            {
                ChangePassword.Visible = false;
                ChangePassword.Enabled = false;
            }
            else
            {
                ForgotPassword.Visible = false;
                ForgotPassword.Enabled = false;
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                EmailManager email = new EmailManager();
                email.sendChangePassword(emailBox.Text);
            }
        }

        protected void SubmitNewPW_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                AccountManager accMgr = new AccountManager();
                int iReturnCode = accMgr.changePassword(NewPassword.Text, Request.QueryString["Email"]);
                switch (iReturnCode)
                {
                    case 1:
                        //Email doesn't exist
                        break;
                    case 2:
                        ChangePassword.Visible = false;
                        ChangePassword.Enabled = false;

                        goodMessage.Visible = true;

                        break;
                }
            }
        }
    }
}