using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Web.UI;
using System.Web.UI.WebControls;
using www.geocaching.com.Geocaching1.Live.data;
using applicationGlobalcaching.Core;
using System.Data.SqlClient;

namespace applicationGlobalcaching
{
    public partial class ABService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * ID int
             * IsPublic bit
             * Created Datetime
             * LastModified datetime
             * GCComUserID int
             * GCComUsername nvarchar(255)
             * FlowID nvarchar(255)
             * FlowName nvarchar(255)
             * FlowContent ntext
             * FlowDescription nvarchar(4000)
             * 
             * */
            string token = Request.Params["token"];
            string func = Request.Params["func"];
            int GCComUserID = -1;
            string GCComUsername = "";

            XmlDocument doc = new XmlDocument();
            XmlElement root = doc.CreateElement("Response");
            doc.AppendChild(root);
            string status = "-1";

            XmlElement el;
            XmlText txt;

            if (!string.IsNullOrEmpty(token) && !string.IsNullOrEmpty(func))
            {
                token = HttpUtility.UrlDecode(token);
                func = HttpUtility.UrlDecode(func);
                UserTokenCache.UserTokenInfo uti = UserTokenCache.Instance.GetUserInfo(token);
                if (uti != null)
                {
                    GCComUsername = uti.Username;
                    GCComUserID = uti.MemberId;
                }
                if (GCComUserID > 0 && !string.IsNullOrEmpty(GCComUsername))
                {
                    if (func == "GETOWN")
                    {
                        el = doc.CreateElement("flows");
                        root.AppendChild(el);

                        using (DBCon dbcon = new DBCon())
                        {
                            SqlDataReader dr = dbcon.ExecuteReader(string.Format("select IsPublic, Created, LastModified, GCComUsername, FlowID, FlowName, FlowDescription from GAPPActionBuilderFlows where GCComUserID={0}", GCComUserID));
                            while (dr.Read())
                            {
                                XmlElement subel = doc.CreateElement("flow");
                                el.AppendChild(subel);

                                XmlElement item = doc.CreateElement("IsPublic");
                                txt = doc.CreateTextNode(dr["IsPublic"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Created");
                                txt = doc.CreateTextNode(((DateTime)dr["Created"]).ToString("s"));
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Modified");
                                txt = doc.CreateTextNode(((DateTime)dr["LastModified"]).ToString("s"));
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Username");
                                txt = doc.CreateTextNode(dr["GCComUsername"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowID");
                                txt = doc.CreateTextNode(dr["FlowID"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowName");
                                txt = doc.CreateTextNode(dr["FlowName"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowDescription");
                                txt = doc.CreateTextNode(dr["FlowDescription"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);
                            }
                        }

                        status = "0";
                    }
                    else if (func == "GETPUBLIC")
                    {
                        el = doc.CreateElement("flows");
                        root.AppendChild(el);

                        using (DBCon dbcon = new DBCon())
                        {
                            SqlDataReader dr = dbcon.ExecuteReader("select IsPublic, Created, LastModified, GCComUsername, FlowID, FlowName, FlowDescription from GAPPActionBuilderFlows where IsPublic=1");
                            while (dr.Read())
                            {
                                XmlElement subel = doc.CreateElement("flow");
                                el.AppendChild(subel);

                                XmlElement item = doc.CreateElement("IsPublic");
                                txt = doc.CreateTextNode(dr["IsPublic"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Created");
                                txt = doc.CreateTextNode(((DateTime)dr["Created"]).ToString("s"));
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Modified");
                                txt = doc.CreateTextNode(((DateTime)dr["LastModified"]).ToString("s"));
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("Username");
                                txt = doc.CreateTextNode(dr["GCComUsername"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowID");
                                txt = doc.CreateTextNode(dr["FlowID"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowName");
                                txt = doc.CreateTextNode(dr["FlowName"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);

                                item = doc.CreateElement("FlowDescription");
                                txt = doc.CreateTextNode(dr["FlowDescription"].ToString());
                                item.AppendChild(txt);
                                subel.AppendChild(item);
                            }
                        }

                        status = "0";
                    }
                    else if (func == "GETFLOWID")
                    {
                        string id = Request.Params["id"];
                        if (!string.IsNullOrEmpty(id))
                        {
                            id = HttpUtility.UrlDecode(id);
                            id = id.Replace("'", "''");
                            using (DBCon dbcon = new DBCon())
                            {
                                SqlDataReader dr = dbcon.ExecuteReader(string.Format("select FlowContent from GAPPActionBuilderFlows where FlowID='{0}' and (IsPublic=1 or GCComUserID={1})", id, GCComUserID));
                                if (dr.Read())
                                {
                                    el = doc.CreateElement("FlowContent");
                                    txt = doc.CreateTextNode(dr["FlowContent"].ToString());
                                    el.AppendChild(txt);
                                    root.AppendChild(el);
                                }
                            }
                            status = "0";
                        }
                        else
                        {
                            status = "3";
                        }
                    }
                    else if (func == "DELETEFLOWID")
                    {
                        string id = Request.Params["id"];
                        if (!string.IsNullOrEmpty(id))
                        {
                            id = HttpUtility.UrlDecode(id);
                            id = id.Replace("'", "''");
                            using (DBCon dbcon = new DBCon())
                            {
                                if ((int)dbcon.ExecuteScalar(string.Format("select count(1) from GAPPActionBuilderFlows where FlowID='{0}' and GCComUserID={1}", id, GCComUserID)) > 0)
                                {
                                    dbcon.ExecuteNonQuery(string.Format("delete from GAPPActionBuilderFlows where FlowID='{0}' and GCComUserID={1}", id, GCComUserID));
                                    status = "0";
                                }
                                else
                                {
                                    status = "4";
                                }
                            }
                            status = "0";
                        }
                        else
                        {
                            status = "3";
                        }
                    }
                    else if (func == "STOREFLOW")
                    {
                        /* IsPublic bit
                        * Created Datetime
                        * LastModified datetime
                        * GCComUserID int
                        * GCComUsername nvarchar(255)
                        * FlowID nvarchar(255)
                        * FlowName nvarchar(255)
                        * FlowContent ntext
                         * FlowDescription ntext(4000)
                         */
                        string IsPublic = Request.Params["IsPublic"];
                        string FlowID = Request.Params["FlowID"];
                        string FlowName = Request.Params["FlowName"];
                        string FlowContent = Request.Params["FlowContent"];
                        string FlowDescription = Request.Params["FlowDescription"];
                        if (!string.IsNullOrEmpty(IsPublic) &&
                            !string.IsNullOrEmpty(FlowID) &&
                            !string.IsNullOrEmpty(FlowName) &&
                            !string.IsNullOrEmpty(FlowContent))
                        {
                            IsPublic = HttpUtility.UrlDecode(IsPublic);
                            FlowID = HttpUtility.UrlDecode(FlowID);
                            FlowName = HttpUtility.UrlDecode(FlowName);
                            FlowContent = HttpUtility.UrlDecode(FlowContent);
                            FlowDescription = HttpUtility.UrlDecode(FlowDescription);
                            using (DBCon dbcon = new DBCon())
                            {
                                FlowID = FlowID.Replace("'", "''");
                                FlowName = FlowName.Replace("'", "''");
                                FlowContent = FlowContent.Replace("'", "''");
                                FlowDescription = FlowDescription.Replace("'", "''");
                                if (IsPublic.ToLower() == "true" || IsPublic == "1")
                                {
                                    IsPublic = "1";
                                }
                                else
                                {
                                    IsPublic = "0";
                                }

                                //FlowID not owned by someone else?
                                if ((int)dbcon.ExecuteScalar(string.Format("select count(1) from GAPPActionBuilderFlows where FlowID='{0}' and GCComUserID<>{1}", FlowID, GCComUserID)) == 0)
                                {
                                    //overwrite
                                    if ((int)dbcon.ExecuteScalar(string.Format("select count(1) from GAPPActionBuilderFlows where FlowID='{0}'", FlowID)) > 0)
                                    {
                                        dbcon.ExecuteNonQuery(string.Format("update GAPPActionBuilderFlows set IsPublic={0}, FlowName='{1}', FlowDescription='{2}', FlowContent='{3}', LastModified = GETDATE() where FlowID='{4}'", IsPublic, FlowName, FlowDescription, FlowContent, FlowID));
                                        status = "0";
                                    }
                                    else
                                    {
                                        //max of 50
                                        if ((int)dbcon.ExecuteScalar(string.Format("select count(1) from GAPPActionBuilderFlows where GCComUserID={0}", GCComUserID)) < 50)
                                        {
                                            //insert
                                            dbcon.ExecuteNonQuery(string.Format("insert into GAPPActionBuilderFlows (IsPublic, FlowName, FlowDescription, FlowContent, FlowID, GCComUserID, GCComUsername) values ({0}, '{1}', '{2}', '{3}', '{4}', {5}, '{6}')", IsPublic, FlowName, FlowDescription, FlowContent, FlowID, GCComUserID, GCComUsername.Replace("'","''")));
                                            status = "0";
                                        }
                                        else
                                        {
                                            status = "6";
                                        }
                                    }
                                }
                                else
                                {
                                    status = "7";
                                }
                            }
                        }
                        else
                        {
                            status = "3";
                        }
                    }
                    else
                    {
                        status = "2"; //unknown function
                    }
                }
                else
                {
                    status = "1"; //unable to validate user
                }
            }

            el = doc.CreateElement("status");
            txt = doc.CreateTextNode(status);
            el.AppendChild(txt);
            root.AppendChild(el);

            doc.Save(Response.OutputStream);
        }
    }
}