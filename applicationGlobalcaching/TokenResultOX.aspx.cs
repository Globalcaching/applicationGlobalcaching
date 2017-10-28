using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicationGlobalcaching
{
    public partial class TokenResultOX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = string.Format("<script language=\"javascript\" type=\"text/javascript\">function getToken(){{return '{0}';}}</script>", Core.TokenManagerOX.CheckUserAuthorization(this) ?? "");
        }
    }
}