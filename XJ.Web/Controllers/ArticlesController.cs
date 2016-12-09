using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xj.MSSQL.Model;

namespace XJ.Web.Controllers
{
    public class ArticlesController : Controller
    {
        public ActionResult Index(string doi)
        {

            return View(doi);
        }

        public ActionResult ArticleToHtml(string doi1,string doi2)
        {
            ViewBag.bodyclass = "fulltext";
            

            SCIJournalEntities db = new SCIJournalEntities();
            string doi = doi1 +"/"+ doi2;
            var model = db.Articles.Where(m =>m.DOI == doi).FirstOrDefault();
            if (model == null)
            {
                return Content("404");
            
            }
            int iid = model.IId;
            int jid = db.JournalIssues.Where(m => m.Id == iid).FirstOrDefault().JId;
            ViewBag.jname = db.Journals.Where(m => m.Id == jid).FirstOrDefault().JName;
            return View(model);        
        }
    }
}
