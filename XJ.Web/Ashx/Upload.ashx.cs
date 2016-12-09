using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace XJ.Web.Ashx
{
    /// <summary>
    /// Upload 的摘要说明
    /// </summary>
    public class Upload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpPostedFile file =context.Request.Files["Filedata"];
            string fileName = Path.GetFileName(file.FileName);
            string fileExt = Path.GetExtension(fileName);
            if (fileExt == ".docx")
            {
                file.SaveAs(context.Server.MapPath("/Journals/" + fileName));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}