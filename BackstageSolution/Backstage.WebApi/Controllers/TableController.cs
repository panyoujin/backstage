using System;
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
    public class TableController : Controller
    {
        private string DBName = "Restaurant";
        [HttpGet]
        public JsonResult TableList(int pageIndex, string tableName, string columnName)
        {
            ApiResponse result = new ApiResponse() { IsOk = true, Message = "获取成功" };

            var dic = this.Request.CreateDictionary();
            //dic["DBName"] = DBName;
            dic["TableName"] = tableName;
            dic["ColumnName"] = columnName;
            result.ReturnData = SQLHelperFactory.Instance.QueryForList("GetTableList", dic);
            return this.ToJsonResult(result);
        }

        // GET api/values/5
        [HttpGet("{tableName}")]
        public JsonResult GetColumnList(string tableName)
        {
            ApiResponse result = new ApiResponse() { IsOk = true, Message = "获取成功" };
            var dic = this.Request.CreateDictionary();
            //dic["DBName"] = DBName;
            dic["TableName"] = tableName;
            result.ReturnData = SQLHelperFactory.Instance.QueryForList("GetTableColumnList", dic);
            return this.ToJsonResult(result);
        }

        // POST api/values
        [HttpPost]
        public JsonResult Post(string tableName)
        {
            ApiResponse result = new ApiResponse() { IsOk = true, Message = "创建成功" };
            var insertTriggerPath = "/Resource/Download/Trigger/trigger_" + tableName + "_insert.txt";
            var updateTriggerPath = "/Resource/Download/Trigger/trigger_" + tableName + "_update_after.txt";
            var deleteTriggerPath = "/Resource/Download/Trigger/trigger_" + tableName + "_delete.txt";
            var insertSql = new StringBuilder();
            var updateSql = new StringBuilder();
            var deleteSql = new StringBuilder();

            //if (tableName != "all")
            //{
            //    var dic = this.Request.CreateDictionary();
            //    //dic["DBName"] = DBName;
            //    dic["TableName"] = tableName;
            //    var c_list = SQLHelperFactory.Instance.QueryForListByT<sys_table_column_model>("GetTableColumnList", dic);
            //    var new_Content = new StringBuilder();
            //    new_Content.Append("'{\"");
            //    var old_Content = new StringBuilder();
            //    old_Content.Append("'{\"");
            //    for (var i = 0; i < c_list.Count; i++)
            //    {
            //        var c = c_list[i];
            //        if (c.column_key == Column_Key_Enum.PRI.ToString())
            //        {
            //            dic["Primary_Key"] = c.column_name;
            //        }
            //        new_Content.Append(c.column_name);
            //        new_Content.Append("\":\"',IFNULL(new.");
            //        new_Content.Append(c.column_name);
            //        new_Content.Append(",'')");
            //        old_Content.Append(c.column_name);
            //        old_Content.Append("\":\"',IFNULL(old.");
            //        old_Content.Append(c.column_name);
            //        old_Content.Append(",'')");
            //        if (i < c_list.Count - 1)
            //        {
            //            new_Content.Append(",'\", ','\"");
            //            old_Content.Append(",'\", ','\"");
            //        }
            //    }
            //    new_Content.Append(",'\"}'");
            //    old_Content.Append(",'\"}'");
            //    dic["New_Content"] = new_Content.ToString();
            //    dic["Old_Content"] = old_Content.ToString();
            //    try
            //    {
            //        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateInsertTrigger", dic);
            //        System.IO.File.WriteAllText(RequestHelper.WebRootPath + insertTriggerPath, sqlAnaly.SqlText);
            //        SQLHelperFactory.Instance.ExecuteNonQuery("CreateInsertTrigger", dic);
            //    }
            //    catch (Exception ex)
            //    {

            //    }
            //    try
            //    {
            //        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateUpdateTrigger", dic);
            //        System.IO.File.WriteAllText(RequestHelper.WebRootPath + updateTriggerPath, sqlAnaly.SqlText);
            //        SQLHelperFactory.Instance.ExecuteNonQuery("CreateUpdateTrigger", dic);
            //    }
            //    catch (Exception ex)
            //    {

            //    }
            //    try
            //    {
            //        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateDeleteTrigger", dic);
            //        System.IO.File.WriteAllText(RequestHelper.WebRootPath + deleteTriggerPath, sqlAnaly.SqlText);
            //        SQLHelperFactory.Instance.ExecuteNonQuery("CreateDeleteTrigger", dic);
            //    }
            //    catch (Exception ex)
            //    {

            //    }
            //    result.ReturnData = new { InsertTriggerPath = insertTriggerPath, UpdateTriggerPath = updateTriggerPath, DeleteTriggerPath = deleteTriggerPath };
            //}
            if (tableName.ToLower() == "all")
            {
                tableName = null;
            }
            var dic = this.Request.CreateDictionary();
            //dic["DBName"] = DBName;
            dic["TableName"] = tableName;
            var tables = SQLHelperFactory.Instance.QueryForList("GetTableList", dic);
            if (tables != null && tables.Count > 0)
            {
                foreach (var table in tables)
                {
                    dic["TableName"] = table.table_name;

                    var c_list = SQLHelperFactory.Instance.QueryForListByT<sys_table_column_model>("GetTableColumnList", dic);
                    var new_Content = new StringBuilder();
                    new_Content.Append("'{\"");
                    var old_Content = new StringBuilder();
                    old_Content.Append("'{\"");
                    for (var i = 0; i < c_list.Count; i++)
                    {
                        var c = c_list[i];
                        if (c.column_key == Column_Key_Enum.PRI.ToString())
                        {
                            dic["Primary_Key"] = c.column_name;
                        }
                        new_Content.Append(c.column_name);
                        new_Content.Append("\":\"',IFNULL(new.");
                        new_Content.Append(c.column_name);
                        new_Content.Append(",'')");
                        old_Content.Append(c.column_name);
                        old_Content.Append("\":\"',IFNULL(old.");
                        old_Content.Append(c.column_name);
                        old_Content.Append(",'')");
                        if (i < c_list.Count - 1)
                        {
                            new_Content.Append(",'\", ','\"");
                            old_Content.Append(",'\", ','\"");
                        }
                    }
                    new_Content.Append(",'\"}'");
                    old_Content.Append(",'\"}'");
                    dic["New_Content"] = new_Content.ToString();
                    dic["Old_Content"] = old_Content.ToString();
                    try
                    {
                        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateInsertTrigger", dic);
                        insertSql.Append(sqlAnaly.SqlText);
                        insertSql.Append("\n");
                        //SQLHelperFactory.Instance.ExecuteNonQuery("CreateInsertTrigger", dic);
                    }
                    catch (Exception ex)
                    {

                    }
                    try
                    {
                        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateUpdateTrigger", dic);

                        updateSql.Append(sqlAnaly.SqlText);
                        updateSql.Append("\n");

                        //SQLHelperFactory.Instance.ExecuteNonQuery("CreateUpdateTrigger", dic);
                    }
                    catch (Exception ex)
                    {

                    }
                    try
                    {
                        var sqlAnaly = DBHelper.SQLAnalytical.CacheSqlConfig.Instance.GetSqlAnalyByKey("CreateDeleteTrigger", dic);

                        deleteSql.Append(sqlAnaly.SqlText);
                        deleteSql.Append("\n");

                        //SQLHelperFactory.Instance.ExecuteNonQuery("CreateDeleteTrigger", dic);
                    }
                    catch (Exception ex)
                    {

                    }
                }

                System.IO.File.WriteAllText(RequestHelper.WebRootPath + insertTriggerPath, insertSql.ToString());
                System.IO.File.WriteAllText(RequestHelper.WebRootPath + updateTriggerPath, updateSql.ToString());
                System.IO.File.WriteAllText(RequestHelper.WebRootPath + deleteTriggerPath, deleteSql.ToString());

                result.ReturnData = new { InsertTriggerPath = insertTriggerPath, UpdateTriggerPath = updateTriggerPath, DeleteTriggerPath = deleteTriggerPath };
            }
            return this.ToJsonResult(result);
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
