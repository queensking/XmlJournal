using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XJ.Journal.Model.Models;

namespace XJ.Web.Controllers
{
    public class DataBaseOperatorController : Controller
    {
        public ActionResult CreateDataBase()
        {
            XmlJournalContext db = new XmlJournalContext();
            db.Journals.Add(new Journal.Model.Models.Journal() {JournalName="I m a Journal" });
            
            db.SaveChanges();
            return Content("数据库建好了");
        }

    }
}
