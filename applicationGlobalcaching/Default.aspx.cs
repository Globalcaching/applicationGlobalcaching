using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace applicationGlobalcaching
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.RedirectPermanent("http://gapp.globalcaching.eu/");
            /*
            if (Request.UserAgent.IndexOf("WOW64") >= 0 ||
                Request.UserAgent.IndexOf("Win64") >= 0)
            {
                x86.Visible = false;
            }
            else
            {
                x64.Visible = false;
            }

            if (!Page.IsPostBack)
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(Server.MapPath("/pkg/x64/gapkg.xml"));
                XmlElement root = xmlDoc.DocumentElement;

                XmlNodeList node = root.SelectNodes("package");
                foreach (XmlNode n in node)
                {
                    if (n.Attributes["type"].InnerText == "core")
                    {
                        x86Verersion.Text = n.Attributes["version"].InnerText;
                    }
                }
            }
             * */
        }
    }
}