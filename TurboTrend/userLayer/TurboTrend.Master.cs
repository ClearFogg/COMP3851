using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TurboTrend.userLayer
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                LoginOrAccount.Text = "Account";
                LoginOrAccountSecond.Text = "Account";
                LoginOrAccount.NavigateUrl = "~/userLayer/account.aspx";
                LoginOrAccountSecond.NavigateUrl = "~/userLayer/account.aspx";

                SignUpOrMatch.Text = "Search";
                SignUpOrMatchSecond.Text = "Search";
                SignUpOrMatch.NavigateUrl = "~/userLayer/match.aspx";
                SignUpOrMatchSecond.NavigateUrl = "~/userLayer/match.aspx";
            }
        }
    }
}