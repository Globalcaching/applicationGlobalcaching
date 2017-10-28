using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetOpenAuth.OAuth;
using DotNetOpenAuth.Messaging;
using System.ServiceModel.Channels;
using System.ServiceModel;
using DotNetOpenAuth.OAuth.ChannelElements;
using System.Configuration;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using www.geocaching.com.Geocaching1.Live.data;

namespace applicationGlobalcaching.Core
{
    public class TokenManager
    {
        private static string WcfTokenManagerTag = "WcfTokenManager";
        private static string WcfAccessTokenTag = "WcfAccessToken";
        private static string WcfTargetTag = "WcfTarget";
        private static string WcfUsernameTag = "WcfUsernameToken";
        private static string WcfMembershipTag = "WcfMembershipToken";

        private static string GetConfigSetting(string setting)
        {
            return ConfigurationManager.AppSettings[string.Concat(setting, "_", GetTarget())];
        }

        private static string GetTarget()
        {
            string result = "";
            if (HttpContext.Current.Session[WcfTargetTag] == null)
            {
                string target = HttpContext.Current.Request.QueryString["target"];
                if (!string.IsNullOrEmpty(target) && target == "staging")
                {
                    HttpContext.Current.Session[WcfTargetTag] = "staging";
                }
                else
                {
                    HttpContext.Current.Session[WcfTargetTag] = "live";
                }
            }
            result = (string)HttpContext.Current.Session[WcfTargetTag];
            return result;
        }

        public static void RequestAuthorization(System.Web.UI.Control ctrl)
        {
            WebConsumer consumer = CreateConsumer(ctrl);
            UriBuilder callback;
            if (ctrl.Page.Request.Url.AbsoluteUri.IndexOf("localhost")>=0)
            {
                callback = new UriBuilder(ctrl.Page.Request.Url.AbsoluteUri.Replace("TokenRequest", "TokenProcess")); // the groundspeak oauth handler will call back to this page
            }
            else
            {
                callback = new UriBuilder("http://application.globalcaching.eu/TokenProcess.aspx"); // the groundspeak oauth handler will call back to this page
            }

            callback.Query = null;
            // At this time Groundspeak is not distinguishing permissions for its API. "All" is the only setting, but you must include the "scope" parameter

            string scope = "All";
            var requestParams = new Dictionary<string, string> {
			    { "scope", scope },
		    };

            try
            {
                // send initial request to and receive response from service provider
                // must send consumersecret and consumerkey in this call

                var response = consumer.PrepareRequestUserAuthorization(callback.Uri, requestParams, null);

                // immediately send response back to service provider to request 
                consumer.Channel.Send(response);
            }
            catch(Exception e)
            {
            }
        }


        public static string CheckUserAuthorization(System.Web.UI.Control ctrl)
        {
            if (ctrl.Page.Session[WcfTokenManagerTag] != null && ctrl.Page.Session[WcfAccessTokenTag] == null)
            {
                if (ctrl.Page.Request.QueryString["oauth_verifier"] != null && ctrl.Page.Request.QueryString["oauth_token"] != null)
                {
                    WebConsumer consumer = CreateConsumer(ctrl);
                    var accessTokenMessage = consumer.ProcessUserAuthorization();
                    if (accessTokenMessage != null && accessTokenMessage.AccessToken != null)
                    {
                        LiveClient lc = new LiveClient(string.Concat("CustomBinding_ILive_", GetTarget()));
                        try
                        {
                            {
                                GetYourUserProfileRequest req = new GetYourUserProfileRequest();
                                req.ProfileOptions = new Tucson.Geocaching.WCF.API.Geocaching1.Types.UserProfileOptions();
                                req.DeviceInfo = new Tucson.Geocaching.WCF.API.Geocaching1.Types.DeviceData();
                                req.DeviceInfo.DeviceName = "globalcaching.eu";
                                req.DeviceInfo.ApplicationSoftwareVersion = "V1.0.0.0";
                                req.DeviceInfo.DeviceUniqueId = "internal";
                                req.AccessToken = accessTokenMessage.AccessToken;
                                GetUserProfileResponse resp = lc.GetYourUserProfile(req);

                                if (resp.Status.StatusCode == 0)
                                {
                                    ctrl.Page.Session[WcfAccessTokenTag] = accessTokenMessage.AccessToken;
                                    ctrl.Page.Session[WcfUsernameTag] = resp.Profile.User.UserName;
                                    ctrl.Page.Session[WcfMembershipTag] = resp.Profile.User.MemberType.MemberTypeId;
                                    try
                                    {
                                        using (DBCon dbcon = new DBCon())
                                        {
                                            if (dbcon.ExecuteNonQuery(string.Format("update GAPPAuthorizations set Requestdate=GETDATE(), Username='{0}', MemberType={1} where MemberId={2}",resp.Profile.User.UserName.Replace("'","''"),resp.Profile.User.MemberType.MemberTypeId, resp.Profile.User.Id??0))==0)
                                            {
                                                dbcon.ExecuteNonQuery(string.Format("insert into GAPPAuthorizations (Requestdate, Username, MemberType, MemberId) values (GETDATE(), '{0}', {1}, {2})", resp.Profile.User.UserName.Replace("'", "''"), resp.Profile.User.MemberType.MemberTypeId, resp.Profile.User.Id ?? 0));
                                            }
                                        }
                                    }
                                    catch
                                    {
                                    }
                                }

                            }
                            lc.Close();
                        }
                        catch
                        {
                        }
                    }
                }
            }
            return ctrl.Page.Session[WcfAccessTokenTag] as string;
        }


        private static WebConsumer CreateConsumer(System.Web.UI.Control ctrl)
        {
            MessageReceivingEndpoint oauthRequestTokenEndpoint;
            MessageReceivingEndpoint oauthUserAuthorizationEndpoint;
            MessageReceivingEndpoint oauthAccessTokenEndpoint;

            // use Post Requests and appropriate endpoints
            oauthRequestTokenEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("gccom_oauth")), HttpDeliveryMethods.PostRequest);
            oauthUserAuthorizationEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("gccom_oauth")), HttpDeliveryMethods.PostRequest);
            oauthAccessTokenEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("gccom_oauth")), HttpDeliveryMethods.PostRequest);

            // in memory token manager should not be used in production. an actual database should be used instead to remember a user's tokens
            var tokenManager = ctrl.Page.Session[WcfTokenManagerTag] as InMemoryTokenManager;
            if (tokenManager == null)
            {
                tokenManager = new InMemoryTokenManager(GetConfigSetting("gccom_consumerkey"), GetConfigSetting("gccom_consumersecret"));
                ctrl.Page.Session[WcfTokenManagerTag] = tokenManager;
            }

            // set up web consumer
            WebConsumer consumer = new WebConsumer(
                new ServiceProviderDescription
                {
                    RequestTokenEndpoint = oauthRequestTokenEndpoint,
                    UserAuthorizationEndpoint = oauthUserAuthorizationEndpoint,
                    AccessTokenEndpoint = oauthAccessTokenEndpoint,
                    TamperProtectionElements = new DotNetOpenAuth.Messaging.ITamperProtectionChannelBindingElement[] {
					    new HmacSha1SigningBindingElement(),
				    },
                },
                tokenManager);

            return consumer;
        }
    }

}