using Saxon.Api;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Xj.CommonModel;
using Xj.MSSQL.Model;
using XJ.Common;
using XJ.Rash.Common;
using XJ.Web.Helper;

namespace XJ.Web.Areas.Admin.Controllers
{
    public class ArticlesController : Controller
    {
        public ActionResult SubmitPaper()
        {

            return View();
        }

        #region 根据文章的id 获得文章全部作者，以及这些作者的单位信息，并将这些信息传入模板，获得模板字符串 +string GetArticleAffiliations(int id)
        /// <summary>
        /// 根据文章的id 获得文章全部作者，以及这些作者的单位信息，并将这些信息传入模板，获得模板字符串
        /// </summary>
        /// <param name="id">文章id</param>
        /// <returns></returns>
        public ArticleAffiliationAuthorInfo GetArticleAffiliations(int id)
        {
            List<ArticleAffiliationModel> affilicationlist = new List<ArticleAffiliationModel>();
            SCIJournalEntities db = new SCIJournalEntities();
            //读取具体一篇文章中的所有单位
            List<int> AffiliationIds = db.ArticleAffiliations.Where(m => m.ArticleId == id).Select(m => m.AffiliationId).ToList();
            for (int i = 0; i < AffiliationIds.Count; i++)
            {
                //获得此循环中作者单位的单位id
                int affiliationid = AffiliationIds[i];
                //根据单位id获得单位
                Affiliation a = db.Affiliations.Where(m => m.Id == affiliationid).FirstOrDefault();
                //如果单位存在
                if (a != null)
                {
                    //创建一个文章单位对象
                    ArticleAffiliationModel aam = new ArticleAffiliationModel();

                    aam.ViewId = i + 1;
                    aam.AffiliationID = AffiliationIds[i];
                    aam.AffiliationText = a.AffiliationName;
                    //将此次单位循环中的单位信息放入集合中
                    affilicationlist.Add(aam);
                }

            }
            string affilitioninfo = this.RenderPartialViewToString("~/Views/Articles/AffiliationInfo.cshtml", affilicationlist);



            //读取具体一篇文章中的所有 <作者-文章> 关系表数据
            List<ArticleAuthor> aa = db.ArticleAuthors.Where(m => m.ArticleId == id).ToList();

            List<ArticleAffiliationAuthor> aaalist = new List<ArticleAffiliationAuthor>();
            for (int i = 0; i < aa.Count; i++)
            {
                ArticleAffiliationAuthor aaa = new ArticleAffiliationAuthor();
                aaa.AffiliationViewIds = new List<int>();
                //将作者提交的单位进行split
                string[] arr = aa[i].AffiliationIds.Split(',');
                foreach (var item in arr)
                {
                    foreach (var _item in affilicationlist)
                    {
                        if (_item.AffiliationID.ToString() == item)
                        {

                            aaa.AffiliationViewIds.Add(_item.ViewId);//将作者单位存入作者单位集合中

                        }
                    }
                }
                //获得作者的类型,1代表第一作者
                aaa.AuthorType = aa[i].AuthorType;
                if (aa[i].Email != null)
                {
                    aaa.Email = aa[i].Email;
                }
                int authorid = aa[i].AuthorId;

                Author author = db.Authors.Where(m => m.Id == authorid).FirstOrDefault();
                if (author != null)
                {
                    aaa.AuthorName = author.AuthorName;
                }
                aaalist.Add(aaa);
            }
            var ArticleInfo = db.Articles.Where(m => m.Id == id).FirstOrDefault();//此处没有判断是否为空

            string doi = ArticleInfo.DOI;
            int iid = ArticleInfo.IId;//获得期刊id
            string receivedDate =DateHelper.GetDateEnFormat(ArticleInfo.ReceivedDate); //ArticleInfo.ReceivedDate.ToString();
            string acceptedDate = DateHelper.GetDateEnFormat(ArticleInfo.AcceptedDate);
            string publishedDate = DateHelper.GetDateEnFormat(ArticleInfo.PublishedDate);
            
            //页码
            string pageindex = ArticleInfo.PageIndex;


            var IssueOfArticle = db.JournalIssues.Where(m => m.Id == iid).FirstOrDefault();
            int jid = IssueOfArticle.JId;
            //多少期
            string iname = IssueOfArticle.IName;
            //年份
            string iyear = IssueOfArticle.PublishDate.Year.ToString();

            var JournalOfArticle = db.Journals.Where(m => m.Id == jid).FirstOrDefault();
            //杂志名称
            string jname = JournalOfArticle.JName;




            HeaderInfo hi = new HeaderInfo()
            {
                AAAList = aaalist,
                Doi = doi,
                AcceptedDate = acceptedDate,
                ReceivedDate = receivedDate,
                PublishedDate = publishedDate,
                Iname = iname,
                Iyear = iyear,
                Jname = jname,
                Pageindex = pageindex
            };
            string authorinfo = this.RenderPartialViewToString("~/Views/Articles/AuthorInfo.cshtml", hi);
            ArticleAffiliationAuthorInfo aaainfo = new ArticleAffiliationAuthorInfo();
            aaainfo.AuthorInfo = authorinfo;
            aaainfo.AffiliationInfo = affilitioninfo;
            aaainfo.publishedYear = iyear;
            return aaainfo;
        }
        #endregion

        public void UploadDoc()
        {
            HttpPostedFileBase file = Request.Files["Filedata"];
            string fileName = Path.GetFileName(file.FileName);
            string fileExt = Path.GetExtension(fileName);
            string docxStorePath = HttpContext.Server.MapPath("/Journal/" + fileName);
            if (fileExt == ".docx" || fileExt == ".xml")
            {
                file.SaveAs(docxStorePath);
            }


            //将word中的图片做一下卫生
            PictureOperator po = new PictureOperator();
            DocxOperator docxO = new DocxOperator();
            List<PictureModel> list = po.OperateDrawing(docxStorePath, "10.1186/s12879-015-1235-y");
            docxO.ReplaceDrawings(docxStorePath, list); 



            //获得xslt文件路径
            string xsltPath = Server.MapPath("~/Xslt/TranslateFromDocxStep9b.xslt");

            DocxDocumentTrans ddt = new DocxDocumentTrans(xsltPath, docxStorePath);

            string xmlPath = ddt.CreateXmlAndReturnPath();
            //string xmlPath = @"E:\workspace\20160906\XmlJournal\XJ.Web\Journals\2.xml";


            //根据文档路径获得文档中 标题样式 的样式Id(在docx中,标题的样式叫做title 他的样式Id却经常为a3,a4,类似等等)
            string titleStyleId = new DocxOperator().GetTitleStyleId(docxStorePath);
            ArticleAffiliationAuthorInfo aaaInfo = GetArticleAffiliations(5);

            Processor processor = new Processor();

            // Load the source document.
            //XdmNode input = processor.NewDocumentBuilder().Build(new Uri(docxStorePath));
            XdmNode input = processor.NewDocumentBuilder().Build(new Uri(xmlPath));

            // Create a transformer for the stylesheet.
            XsltTransformer transformer = processor.NewXsltCompiler().Compile(new Uri(xsltPath)).Load();

            // Set the root node of the source document to be the initial context node.
            transformer.InitialContextNode = input;

            transformer.SetParameter(new QName("", "", "titleStyleId"), new XdmAtomicValue(titleStyleId));
            transformer.SetParameter(new QName("", "", "authorInfo"), new XdmAtomicValue(aaaInfo.AuthorInfo));
            transformer.SetParameter(new QName("", "", "affiliationInfo"), new XdmAtomicValue(aaaInfo.AffiliationInfo));
            transformer.SetParameter(new QName("", "", "publishedYear"), new XdmAtomicValue(aaaInfo.publishedYear));

            // BaseOutputUri is only necessary for xsl:result-document.
            transformer.BaseOutputUri = new Uri(xsltPath);



            // Create a serializer. 
            Serializer serializer = new Serializer();
            //TextWriter tw = new StreamWriter();
            //serializer.SetOutputWriter(Response.Output);
            //serializer.SetOutputFile(Server.MapPath(@"D:\test.html"));
            serializer.SetOutputFile(@"D:\MyAnswer.txt");



            // Transform the source XML to System.out.
            transformer.Run(serializer);

            string str = System.IO.File.ReadAllText(@"D:\MyAnswer.txt");
            SCIJournalEntities db = new SCIJournalEntities();
            var model = db.Articles.Where(m => m.Id == 5).FirstOrDefault();
            model.Html = str;

            db.SaveChanges();



        }







    }
}
