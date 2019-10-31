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
            if (Session["businessName"] == null)
            {
                Response.Redirect("~/userLayer/login.aspx");
            }
            else
            {
                DatabaseConnection db = new DatabaseConnection();
                string bName = db.getEmailFromBusinessName((string)Session["businessName"]);

                businessName.Text = bName;
            }
        }

        protected void changePasswordButton_Click(object sender, EventArgs e)
        {
            EmailManager email = new EmailManager();
            
        }
    }
}