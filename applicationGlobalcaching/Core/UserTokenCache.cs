using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using www.geocaching.com.Geocaching1.Live.data;

namespace applicationGlobalcaching.Core
{
    public class UserTokenCache
    {
        public class UserTokenInfo
        {
            public string Token { get; set; }
            public string Username { get; set; }
            public int MemberId { get; set; }
            public int MembershipTypeId { get; set; }

            public DateTime DataFromTime { get; set; }
        }
        private List<UserTokenInfo> _userTokenInfo = null;

        private static UserTokenCache _uniqueInstance = null;
        private static object _lockObject = new object();

        private UserTokenCache()
        {
            _userTokenInfo = new List<UserTokenInfo>();
        }

        public static UserTokenCache Instance
        {
            get
            {
                if (_uniqueInstance == null)
                {
                    lock (_lockObject)
                    {
                        if (_uniqueInstance == null)
                        {
                            _uniqueInstance = new UserTokenCache();
                        }
                    }
                }
                return _uniqueInstance;
            }
        }

        public UserTokenInfo GetUserInfo(string token)
        {
            UserTokenInfo result = null;
            DateTime threshold = DateTime.Now.AddHours(-1);
            lock (_userTokenInfo)
            {
                List<UserTokenInfo> oldData = (from a in _userTokenInfo where a.DataFromTime < threshold select a).ToList();
                foreach (UserTokenInfo ti in oldData)
                {
                    _userTokenInfo.Remove(ti);
                }
                result = (from a in _userTokenInfo where a.Token == token select a).FirstOrDefault();
            }
            if (result == null)
            {
                LiveClient lc = new LiveClient("CustomBinding_ILive_live");
                try
                {
                    {
                        GetYourUserProfileRequest req = new GetYourUserProfileRequest();
                        req.ProfileOptions = new Tucson.Geocaching.WCF.API.Geocaching1.Types.UserProfileOptions();
                        req.DeviceInfo = new Tucson.Geocaching.WCF.API.Geocaching1.Types.DeviceData();
                        req.DeviceInfo.DeviceName = "globalcaching.eu";
                        req.DeviceInfo.ApplicationSoftwareVersion = "V1.0.0.0";
                        req.DeviceInfo.DeviceUniqueId = "internal";
                        req.AccessToken = token;
                        GetUserProfileResponse resp = lc.GetYourUserProfile(req);

                        if (resp.Status.StatusCode == 0)
                        {
                            result = new UserTokenInfo();
                            result.Token = token;
                            result.MemberId = (int)(long)resp.Profile.User.Id;
                            result.Username = resp.Profile.User.UserName;
                            result.MembershipTypeId = (int)resp.Profile.User.MemberType.MemberTypeId;
                            result.DataFromTime = DateTime.Now;
                            lock (_userTokenInfo)
                            {
                                _userTokenInfo.Add(result);
                            }
                        }

                    }
                    lc.Close();
                }
                catch
                {
                }
            }
            return result;
        }
    }
}