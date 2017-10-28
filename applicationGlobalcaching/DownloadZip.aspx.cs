using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicationGlobalcaching
{
    public partial class DownloadZip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UserAgent.IndexOf("WOW64") >= 0 ||
                Request.UserAgent.IndexOf("Win64") >= 0)
            {
                Response.Redirect("/pkg/x64/gapp.zip");
            }
            else
            {
                Response.Redirect("/pkg/x86/gapp.zip");
            }
        }
    }
}