using System;
using System.IO;
using System.Text;
using Newtonsoft.Json;

namespace Backstage.Common
{
    public static class JsonExtend
    {
        public static string ToJson(this object obj)
        {
            if(obj==null)
            {
                return "{}";
            }
            return JsonConvert.SerializeObject(obj);
        }

        public static T ToModel<T>(this string str)
        {
            return JsonConvert.DeserializeObject<T>(str);
        }

        public static T ReadConfig<T>(this string filePath)
        {
            if (!File.Exists(filePath))
            {
                throw new Exception(filePath + "不存在");
            }
            var t = File.ReadAllText(filePath, Encoding.Default).ToModel<T>();
            return t;
        }
    }
}
