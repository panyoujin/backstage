using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backstage.Models.Common;
using Backstage.Models.sys;
using Backstage.WebApi.Helper;
using DBHelper.SQLHelper;
using Microsoft.AspNetCore.Mvc;

namespace Backstage.WebApi.Controllers
{
    [Route("api/sys/[controller]")]
    public class TableController : Controller
    {
        [HttpGet]
        public JsonResult TableList(int pageIndex, string tableName, string columnName)
        {
            JsonModel result = new JsonModel() { IsOk = true, Message = "获取成功" };

            var dic = this.Request.CreateDictionary();
            dic["DBName"] = "backstage";
            dic["TableName"] = tableName;
            dic["ColumnName"] = columnName;
            result.ReturnData = SQLHelperFactory.Instance.QueryForList("GetTableList", dic);
            return this.ToJsonResult(result);
        }

        // GET api/values/5
        [HttpGet("{tableName}")]
        public JsonResult GetColumnList(string tableName)
        {
            JsonModel result = new JsonModel() { IsOk = true, Message = "获取成功" };
            var dic = this.Request.CreateDictionary();
            dic["DBName"] = "backstage";
            dic["TableName"] = tableName;
            result.ReturnData = SQLHelperFactory.Instance.QueryForList("GetTableColumnList", dic);
            return this.ToJsonResult(result);
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
