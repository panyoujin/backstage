using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backstage.WebApi.Helper
{
    public static class RequestHelper
    {
        public static Dictionary<string, object> CreateDictionary(this Microsoft.AspNetCore.Http.HttpRequest request)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            var dbname = request.GetHeader("ConnectionPrefix");
            if (!string.IsNullOrWhiteSpace(dbname))
            {
                dic["ConnectionPrefix"] = dbname;
            }
            return dic;
        }

        public static string GetHeader(this Microsoft.AspNetCore.Http.HttpRequest request, string key)
        {
            //key = key.Base64Encode();
            if (request.Headers.ContainsKey(key))
            {
                byte[] bytes = Convert.FromBase64String(request.Headers[key]);
                return Encoding.UTF8.GetString(bytes);
            }
            return "";
        }

        public static string Base64Encode(this string content)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(content);
            return Convert.ToBase64String(bytes);
        }
    }
}
