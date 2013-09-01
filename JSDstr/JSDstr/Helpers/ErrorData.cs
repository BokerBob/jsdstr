using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JSDstr.Helpers
{
    public class ErrorData
    {
        public int HttpCode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public ErrorData(int httpCode, string name, string description = "")
        {
            HttpCode = httpCode;
            Name = name;
            Description = description;
        }
    }
}