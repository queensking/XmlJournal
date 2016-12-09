using DocumentFormat.OpenXml.Packaging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Xsl;
using XmlPrime;

namespace XJ.Rash.Common
{
    public class DocxDocumentTrans
    {
        string xsltpath;
        string docxpath;
        private string xmlcontent;
        //空的构造函数
        public DocxDocumentTrans()
        {
        }
        #region 同时为xslt路径和xml内容赋值的构造函数 DocxDocumentTrans(string _xsltpath, string _xmlpath)
        /// <summary>
        /// 同时为xslt路径和xml内容赋值的构造函数
        /// </summary>
        /// <param name="_xsltpath">xslt文件路径</param>
        /// <param name="_xmlpath">xml文件路径</param>
        public DocxDocumentTrans(string _xsltpath, string _docxpath)
        {
            this.xsltpath = _xsltpath;
            docxpath = _docxpath;
            this.xmlcontent = GetXml(_docxpath);
        }
        #endregion

        #region 1.0 获取Xml内容 +string GetXml(string xmlpath)
        /// <summary>
        /// 获取Xml内容
        /// </summary>
        /// <param name="xmlpath">xml文件的路径</param>
        /// <returns></returns>
        public string GetXml(string xmlpath)
        {
            using (WordprocessingDocument doc = WordprocessingDocument.Open(xmlpath, true))
            {
                var xml = doc.MainDocumentPart.Document.Body.OuterXml;

                return xml;
            }
        }
        #endregion

        public string CreateXmlAndReturnPath()
        {
            //String xmlPath = Path.GetFullPath(docxpath)+".xml";
            int extMarkPosition=Path.GetFullPath(docxpath).LastIndexOf('.');
            string xmlPath = docxpath.Substring(0, extMarkPosition)+".xml";
            using (StreamWriter writer = new StreamWriter(xmlPath))
            {
                writer.Write(this.xmlcontent);            
            }
            return xmlPath;        
        }

        #region 3.0 获得Docx文件用xslt转出来的html字符串 +string TransToStr(string titleStyleId)
        /// <summary>
        /// 获得Docx文件用xslt转出来的html字符串
        /// </summary>
        /// <param name="titleStyleId">论文标题样式Id</param>
        /// <returns>xslt转出来的html字符串</returns>
        public string TransToStr(string titleStyleId, string authorInfo, string affiliationInfo)
        {
            //用来接收将xml转成html的流
            MemoryStream ms = new MemoryStream();

            //xslt编译转换对象
            System.Xml.Xsl.XslCompiledTransform trans = new System.Xml.Xsl.XslCompiledTransform();//------------trans
            //xslt参数对象
            XsltArgumentList argsList = new XsltArgumentList();
            argsList.AddParam("titleStyleId", "", titleStyleId);
            //将作者信息html作为参数 传入到xslt文件中
            argsList.AddParam("authorInfo", "", authorInfo);
            //将单位信息html作为参数 传入到xslt文件中
            argsList.AddParam("affiliationInfo", "", affiliationInfo);

            //根据xslt文件路径读取 xslt文件内容
            using (StreamReader rdr = new StreamReader(new FileStream(this.xsltpath, FileMode.Open)))
            {

                //将读到的xslt内容加载到XmlReader里面
                using (XmlReader xmlRdr = new XmlTextReader(rdr))
                {
                    //将xmlRdr内容加载到trans里面                    
                    trans.Load(xmlRdr);
                }
            }
            //创建一个新的XmlDocument对象
            XmlDocument document = new XmlDocument();//------------document
            //用document对象加载xml内容
            document.LoadXml(this.xmlcontent);

            trans.Transform(document, argsList, ms);

            ms.Position = 0;
            StreamReader reader = new StreamReader(ms, Encoding.UTF8);
            string result = reader.ReadToEnd();
            return result;
        }
        #endregion


    }
}
