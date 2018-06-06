using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backstage.Models.sys;
using Backstage.WebApi.Helper;
using DBHelper.SQLHelper;
using Microsoft.AspNetCore.Mvc;

namespace Backstage.WebApi.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        // GET api/values
        [HttpGet]
        public IEnumerable<object> Get()
        {
            var dic = this.Request.CreateDictionary();
            dic["DBName"] = "backstage";
            var list = SQLHelperFactory.Instance.QueryForList("GetTableList", dic);
            return list;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
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
