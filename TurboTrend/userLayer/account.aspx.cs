using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurboTrend.Business_Layer;
using TurboTrend.Business;

namespace TurboTrend.userLayer
{
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("~/userLayer/login.aspx");
            }
            else
            {
                businessName.Text = (string)Session["userName"];

                AccountManager accMgr = new AccountManager();
                string sName = accMgr.getEmailFromUsername((string)Session["userName"]);

                accEmail.Text = sName;
            }
        }

        protected void changePasswordButton_Click(object sender, EventArgs e)
        {
            EmailManager email = new EmailManager();
            AccountManager accMgr = new AccountManager();

            email.sendChangePassword(accMgr.getEmailFromUsername((string)Session["userName"]));
        }
    }
}