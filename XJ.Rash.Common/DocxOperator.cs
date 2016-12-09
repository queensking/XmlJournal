using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Rash.Common
{
    public class DocxOperator
    {

        public void ReplaceDrawings(string filename, List<PictureModel> pmlist)
        {
            List<Paragraph> plist = new List<Paragraph>();
            using (WordprocessingDocument doc = WordprocessingDocument.Open(filename, true))
            {
                var paragraphs = doc.MainDocumentPart.Document.Body.Descendants<Paragraph>();
                foreach (var p in paragraphs)
                {
                    if (p.Descendants<Drawing>().Count() > 0)
                    {
                        plist.Add(p);
                    }
                }
                if (plist.Count > 0)
                {
                    foreach (var p in plist)
                    {
                        string embed = p.Descendants<DocumentFormat.OpenXml.Drawing.Blip>().FirstOrDefault().Embed;
                        PictureModel pm = pmlist.Where(m => m.TheEmbed == embed).FirstOrDefault();
                        Paragraph _p = CreateDrawParagraph(pm);
                        //doc.MainDocumentPart.Document.Body.RemoveChild<Paragraph>(p);
                        doc.MainDocumentPart.Document.Body.ReplaceChild<Paragraph>(_p, p);
                    }
                }
            }
        }

        #region 1.0根据PictureModel创建 新的段落元素 + Paragraph CreateDrawParagraph(PictureModel pm)
        /// <summary>
        /// 根据PictureModel创建 新的段落元素
        /// </summary>
        /// <param name="pm">PictureModel实例</param>
        /// <returns>一个新的段落节点</returns>
        public Paragraph CreateDrawParagraph(PictureModel pm)
        {
            Paragraph paragraph1 = new Paragraph() { RsidParagraphAddition = "DrawingParagraph" };
            BookmarkStart bookmarkStart1 = new BookmarkStart() { Name = pm.PicturePath, Id = pm.TheEmbed };
            BookmarkEnd bookmarkEnd1 = new BookmarkEnd() { Id = "0" };

            paragraph1.Append(bookmarkStart1);
            paragraph1.Append(bookmarkEnd1);
            return paragraph1;

        }
        #endregion






        #region 根据docx的路径 读取docx里样式名为Title的样式，获得Title样式的Id +string GetTitleStyleId(string docxpath)
        /// <summary>
        /// 根据docx的路径 读取docx里样式名为Title的样式，获得Title样式的Id
        /// </summary>
        /// <param name="docxpath">docx路径</param>
        /// <returns>docx里标记标题样式的Id</returns>
        public string GetTitleStyleId(string docxpath)
        {
            string str = "";
            using (WordprocessingDocument doc = WordprocessingDocument.Open(docxpath, true))
            {
                var styles = doc.MainDocumentPart.StyleDefinitionsPart.Styles;
                List<Style> listStyle = styles.Descendants<Style>().ToList();
                Style style = listStyle.Where(m => m.StyleName.Val == "Title").FirstOrDefault();
                str = style.StyleId;

            }
            return str;
        } 
        #endregion
    }
}
