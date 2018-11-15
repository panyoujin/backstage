using System.Runtime.Serialization;

namespace Backstage.Models.Common
{
    public class ApiResponse
    {
        /// <summary>
        /// 处理是否成功
        /// </summary>
        [DataMember(Name= "isOk")]
        public bool IsOk { get; set; }
        /// <summary>
        /// 处理是否出错
        /// </summary>
        [DataMember(Name = "isError")]
        public bool IsError { get; set; }
        /// <summary>
        /// 处理描述
        /// </summary>
        [DataMember(Name = "message")]
        public string Message { get; set; }
        /// <summary>
        /// 处理返回结果
        /// </summary>
        [DataMember(Name = "returnData")]
        public object ReturnData { get; set; }
        /// <summary>
        /// 列表行数
        /// </summary>
        [DataMember(Name = "listCount")]
        public int ListCount { get; set; }

    }
}
