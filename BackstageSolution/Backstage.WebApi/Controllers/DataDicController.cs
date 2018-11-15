using System;
using System.Linq;
using System.Text;
using Backstage.Models.Common;
using Backstage.Models.Enums;
using Backstage.Models.sys;
using Backstage.WebApi.Helper;
using DBHelper.SQLHelper;
using Microsoft.AspNetCore.Mvc;

namespace Backstage.WebApi.Controllers
{
    [Route("api/sys/[controller]")]
    public class DataDicController : Controller
    {
        [HttpGet]
        public JsonResult DataDicList(int pageIndex, string name, string code)
        {
            ApiResponse result = new ApiResponse() { IsOk = true, Message = "获取成功" };

            var dic = this.Request.CreateDictionary();
            dic["Name"] = name;
            dic["Code"] = code;
            var data = SQLHelperFactory.Instance.QueryForListByT<p_data_dic_model>("GetDataDicList", dic);
            if (data != null && data.Count > 0)
            {
                var parentList = data.Where(d => d.parentId == 0).ToList();
                data.RemoveAll(d => d.parentId == 0);
                foreach (var parent in parentList)
                {
                    parent.nodes = data.Where(d => d.parentId == parent.id).ToList();
                    data.RemoveAll(d => d.parentId == parent.id);
                }
                result.ReturnData = parentList;
            }

            return this.ToJsonResult(result);
        }
    }
}
