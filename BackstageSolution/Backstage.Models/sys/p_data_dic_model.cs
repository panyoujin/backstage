using System;
using System.Collections.Generic;
using System.Text;

namespace Backstage.Models.sys
{
    public class p_data_dic_model
    {
        public int id { get; set; }
        public int parentId { get; set; }
        public string name { get; set; }
        public string code { get; set; }
        public string desc { get; set; }
        public List<p_data_dic_model> nodes { get; set; }
    }
}
