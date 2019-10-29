using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurboTrend.Business_Layer;

namespace TurboTrend.userLayer
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitInquiry_Click(object sender, EventArgs e)
        {
            EmailManager email = new EmailManager();
            email.sendInquiry(userInqury.Text, emailAddress.Text);

            pageContent.Visible = false;
            SentInqiury.Visible = true;
        }
    }
}