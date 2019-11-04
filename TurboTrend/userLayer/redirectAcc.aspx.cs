using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TurboTrend.userLayer
{
    public partial class redirectAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["account"] != null)
            {
                Response.Redirect("http://www.instagram.com/" + Request.QueryString["account"]);
            }
        }
    }
}