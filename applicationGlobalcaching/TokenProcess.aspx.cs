using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicationGlobalcaching
{
    public partial class TokenProcess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Core.TokenManager.CheckUserAuthorization(this);
            Response.Redirect(string.Format("/TokenResult.aspx?q={0}", Guid.NewGuid().ToString("N")));
        }
    }
}