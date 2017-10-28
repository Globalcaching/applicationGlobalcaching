using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicationGlobalcaching
{
    public partial class TokenProcessOB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Core.TokenManagerOB.CheckUserAuthorization(this);
            Response.Redirect(string.Format("/TokenResultOB.aspx?q={0}", Guid.NewGuid().ToString("N")));
        }
    }
}