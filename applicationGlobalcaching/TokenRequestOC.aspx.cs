using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicationGlobalcaching
{
    public partial class TokenRequestOC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Core.TokenManagerOC.RequestAuthorization(this);
        }
    }
}