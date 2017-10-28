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

namespace applicationGlobalcaching.Core
{
    public class TokenManagerOX
    {
        private static string WcfTokenManagerTag = "WcfTokenManagerOX";
        private static string WcfAccessTokenTag = "WcfAccessTokenOX";

        private static string GetConfigSetting(string setting)
        {
            return ConfigurationManager.AppSettings[setting];
        }

        public static void RequestAuthorization(System.Web.UI.Control ctrl)
        {
            WebConsumer consumer = CreateConsumer(ctrl);
            UriBuilder callback = new UriBuilder(ctrl.Page.Request.Url.AbsoluteUri.Replace("TokenRequestOX","TokenProcessOX")); // the opencaching oauth handler will call back to this page

            callback.Query = null;

            try
            {
                // send initial request to and receive response from service provider
                // must send consumersecret and consumerkey in this call

                var response = consumer.PrepareRequestUserAuthorization(callback.Uri, null, null);

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
                        MessageReceivingEndpoint ep = new MessageReceivingEndpoint(new Uri("http://test.opencaching.com/api/geocache/OX3HEY3.gpx?Authorization=D3BBjbMbcw7wXAP3"), HttpDeliveryMethods.GetRequest);
                        var request = consumer.PrepareAuthorizedRequest(ep, accessTokenMessage.AccessToken);
                        using (var response = request.GetResponse())
                        {
                            using (System.IO.StreamReader sr = new System.IO.StreamReader(response.GetResponseStream()))
                            {
                                string result = sr.ReadToEnd();
                            }
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
            oauthRequestTokenEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("occom_oauth_request")), HttpDeliveryMethods.PostRequest);
            oauthUserAuthorizationEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("occom_oauth_authorize")), HttpDeliveryMethods.GetRequest);
            oauthAccessTokenEndpoint = new MessageReceivingEndpoint(new Uri(GetConfigSetting("occom_oauth_gettoken")), HttpDeliveryMethods.PostRequest);

            // in memory token manager should not be used in production. an actual database should be used instead to remember a user's tokens
            var tokenManager = ctrl.Page.Session[WcfTokenManagerTag] as InMemoryTokenManager;
            if (tokenManager == null)
            {
                tokenManager = new InMemoryTokenManager(GetConfigSetting("occom_consumerkey"), GetConfigSetting("occom_consumersecret"));
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