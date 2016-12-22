using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using XJ.Rash.Docx.Model;

namespace XJ.Rash.Docx
{
    public class DocxBase
    {
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

        #region 2.0 根据docx的路径 读取docx里样式名为Title的样式，获得Title样式的Id +string GetTitleStyleId(string docxpath)
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

        //********************图片处理***********************

        //往docx文档中将老标签的图片替换成新标签

        #region 3.1根据PictureModel创建 新的段落元素 + Paragraph CreateDrawParagraph(PictureModel pm)
        /// <summary>
        /// 根据PictureModel创建 新的段落元素
        /// </summary>
        /// <param name="pm">PictureModel实例</param>
        /// <returns>一个新的段落节点</returns>
        public Paragraph CreateDrawParagraph(PictureModel pm)
        {
            Paragraph paragraph1 = new Paragraph() { RsidParagraphAddition = "DrawingParagraph" };
            BookmarkStart bookmarkStart1 = new BookmarkStart() { Name = pm.PicturePath, Id = pm.EmbedStr };
            BookmarkEnd bookmarkEnd1 = new BookmarkEnd() { Id = "0" };

            paragraph1.Append(bookmarkStart1);
            paragraph1.Append(bookmarkEnd1);
            return paragraph1;

        }
        #endregion

        #region 3.2 将docx里面的 draw段落替换掉 +void ReplaceDrawings(string filename, List<PictureModel> pmlist)
        /// <summary>
        /// 将docx里面的 draw段落替换掉
        /// </summary>
        /// <param name="filename">docx文件路径</param>
        /// <param name="pmlist">传递过来的图片信息集合,这个信息集合应该源于将图片从docx中另存之后 保存了图片的路径等信息 </param>
        public void ReplaceDrawings(string filename, List<PictureModel> pmlist)
        {
            //创建一个段落集合 用来存放 图片段落
            List<Paragraph> plist = new List<Paragraph>();
            //打开指定docx文件
            using (WordprocessingDocument doc = WordprocessingDocument.Open(filename, true))
            {
                //获得所有段落
                var paragraphs = doc.MainDocumentPart.Document.Body.Descendants<Paragraph>();
                //遍历所有的段落
                foreach (var p in paragraphs)
                {
                    //如果段落中包含有Draw标签 就把这个段落放到集合中
                    if (p.Descendants<Drawing>().Count() > 0)
                    {
                        plist.Add(p);
                    }
                }
                if (plist.Count > 0)
                {
                    //遍历有draw标签的集合
                    foreach (var p in plist)
                    {
                        //获得这些段落里面第一张图片的Embed属性
                        string embed = p.Descendants<DocumentFormat.OpenXml.Drawing.Blip>().FirstOrDefault().Embed;
                        //遍历传进来的PmModel集合，寻找是否有Embed数据与之相符
                        PictureModel pm = pmlist.Where(m => m.EmbedStr == embed).FirstOrDefault();
                        if (pm!=null)
                        {
                            Paragraph _p = CreateDrawParagraph(pm);
                            //doc.MainDocumentPart.Document.Body.RemoveChild<Paragraph>(p);
                            doc.MainDocumentPart.Document.Body.ReplaceChild<Paragraph>(_p, p);
                        }
                       
                    }
                }
            }
        }
        #endregion

        //将docx中的图片 按照BMC路径风格存储起来

        #region 4.1 根据DOI和图片在上下文中的位置创建图片的名字，注意不带后缀 +string CreateImgName(string DOI, int index)
        /// <summary>
        /// 根据DOI和图片在上下文中的位置创建图片的名字，注意不带后缀
        /// </summary>
        /// <param name="DOI">文章的DOI</param>
        /// <param name="index">图片在上下文中的位置索引</param>
        /// <returns>图片的名字(不带后缀)</returns>
        public string CreateImgName(string DOI, int index)
        {
            //将DOI 按照'/'字符分成两段
            string[] arr = DOI.Split('/');

            //获取第二段字符串 最后一个'-'字符的索引
            int length = arr[1].LastIndexOf('-');
            //对第二段字符串进行裁剪 获得形如 13231_2016_20 的字符串 然后用这个字符串拼接出形如下面的图片名
            //https://static-content.springer.com/image/art%3A10.1186%2Fs13231-016-0020-3/MediaObjects/13231_2016_20_Fig2_HTML.gif
            string str = arr[1].Substring(1, length).Replace('-', '_');
            //图片存储在网站里面的文件夹的绝对路径
            string dirpath = "/static-content/image/art%3A" + arr[0] + "%2F" + arr[1] + "/MediaObjects/";



            //文件在硬盘中的路径
            string ImageStorePath = HttpContext.Current.Server.MapPath(dirpath);




            if (!Directory.Exists(ImageStorePath))
                Directory.CreateDirectory(ImageStorePath);

            string imgName = ImageStorePath + str + "Fig" + index + "_HTML";
            return imgName;
        }
        #endregion


        #region 4.2根据图片的ContentType 返回图片后缀 +string GetSuffix(string contentType)
        /// <summary>
        /// 根据图片的ContentType 返回图片后缀
        /// </summary>
        /// <param name="contentType">图片ContentType</param>
        /// <returns>返回图片后缀</returns>
        public string GetSuffix(string contentType)
        {
            string str = "jpg";
            switch (contentType)
            {
                case "image/jpeg":
                    break;
                case "image/gif":
                    str = "gif";
                    break;
                case "image/png":
                    str = "png";
                    break;
                default:
                    break;
            }
            return str;

        }
        #endregion

        #region 4.3根据图片信息保存图片 并返回图片的完整名字 +string SaveDocxImage(string DOI, string contentType, int imgindex, Image img)
        /// <summary>
        /// 根据图片信息保存图片 并返回图片的完整名字
        /// </summary>
        /// <param name="DOI">文章的DOI</param>
        /// <param name="contentType">图片的类型</param>
        /// <param name="imgindex">图片在文章中的位置</param>
        /// <param name="img">Image类的一个对象</param>
        /// <returns></returns>
        public string SaveDocxImage(string DOI, string contentType, int imgindex, ImagePart imgpart)
        {
            //创建不带后缀的文件名
            string filenamewithoutsuffix = CreateImgName(DOI, imgindex);
            string suffix = GetSuffix(contentType);
            string filename = filenamewithoutsuffix + "." + suffix;
            Image img = Image.FromStream(imgpart.GetStream());
            img.Save(filename);
            return filename;
        }
        #endregion

        #region 4.4 遍历docx文档 寻找有draw子节点的段落 将找到的图片根据doi存储起来 并返回图片信息集合 +List<PictureModel> StoreDocxImg(string docxfilepath, string DOI)
        /// <summary>
        /// 遍历docx文档 寻找有draw子节点的段落 将找到的图片根据doi存储起来 并返回图片信息集合
        /// </summary>
        /// <param name="docxfilepath">docx文件路径</param>
        /// <param name="DOI">文章doi</param>
        /// <returns>返回图片信息集合</returns>
        public List<PictureModel> StoreDocxImg(string docxfilepath, string DOI)
        {
            List<PictureModel> dmList = new List<PictureModel>();
            //读取word文档 获得word文档
            using (WordprocessingDocument doc = WordprocessingDocument.Open(docxfilepath, true))
            {
                var mainpart = doc.MainDocumentPart;
                var body = doc.MainDocumentPart.Document.Body;
                //拿到段落中存在Drawing的 段落列表
                var paragraphes = body.Descendants<Paragraph>().Where(t => t.Descendants<Drawing>().Count() > 0).ToList();//DocumentFormat.OpenXml.Wordprocessing.Paragraph
                if (paragraphes.Count() > 0)
                {
                    for (int i = 0; i < paragraphes.Count(); i++)
                    {
                        var blip = paragraphes[i].Descendants<DocumentFormat.OpenXml.Drawing.Blip>().FirstOrDefault();
                        if (null != blip)
                        {
                            PictureModel pm = new PictureModel();
                            //获取blip标签下面的Embed属性
                            pm.EmbedStr = blip.Embed;
                            //根据Embed属性所代表的id 找到所代表的ImagePart 
                            ImagePart imgpart = mainpart.GetPartById(blip.Embed) as ImagePart;
                            //Image img=Image.FromStream(imgpart.GetStream());
                            //根据所找到的Imagepart  找到里面的流
                            string contentType = imgpart.ContentType;
                            //将图片保存起来 并返回保存的路径信息
                            pm.PicturePath = SaveDocxImage(DOI, contentType, i + 1, imgpart);
                            dmList.Add(pm);
                        }
                    }
                }

            }
            return dmList;

        }
        #endregion

        //这方法 综合方法3和4 保存docx中的图片，然后将docx中的图片段落信息对照修改

        #region 5.0 遍历docx,如果存在图片，先保存图片 再将docx里面的标签进行修改 -OperateDocxImg(string docxfilepath, string DOI)
        /// <summary>
        /// 遍历docx,如果存在图片，先保存图片 再将docx里面的标签进行修改
        /// </summary>
        /// <param name="docxfilepath">docx文件路径</param>
        /// <param name="DOI">Doi</param>
        public void OperateDocxImg(string docxfilepath, string DOI)
        {
            //1.进行docx遍历，存储图片
            List<PictureModel> list = StoreDocxImg(docxfilepath, DOI);
            //2.如果docx里面有图片 list就不会返回空 此时进行第2步 将docx里面的标签修改掉 
            if (null!=list)
            {
                ReplaceDrawings(docxfilepath, list);
            }

        }
        #endregion



        //********************表格处理***********************


    }
}
