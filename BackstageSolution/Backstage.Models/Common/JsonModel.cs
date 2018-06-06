namespace Backstage.Models.Common
{
    public class JsonModel
    {
        /// <summary>
        /// 处理是否成功
        /// </summary>
        public bool IsOk { get; set; }
        /// <summary>
        /// 处理是否出错
        /// </summary>
        public bool IsError { get; set; }
        /// <summary>
        /// 处理描述
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// 处理返回结果
        /// </summary>
        public object ReturnData { get; set; }
        /// <summary>
        /// 列表行数
        /// </summary>
        public int ListCount { get; set; }

    }
}
