using DocumentFormat.OpenXml.Drawing;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Rash.Common
{
    public class PictureOperator
    {
        #region 遍历docx文档 寻找有draw子节点的段落 将找到的图片根据doi存储起来 并返回图片信息集合
        /// <summary>
        /// 遍历docx文档 寻找有draw子节点的段落 将找到的图片根据doi存储起来 并返回图片信息集合
        /// </summary>
        /// <param name="docxfilepath">docx文件路径</param>
        /// <param name="DOI">文章doi</param>
        /// <returns>返回图片信息集合</returns>
        public List<PictureModel> OperateDrawing(string docxfilepath, string DOI)
        {
            List<PictureModel> dmList = new List<PictureModel>();
            //读取word文档 获得word文档
            using (WordprocessingDocument doc = WordprocessingDocument.Open(docxfilepath, true))
            {
                var mainpart = doc.MainDocumentPart;
                var body = doc.MainDocumentPart.Document.Body;
                //拿到段落中存在Drawing的 段落列表
                var paragraphes = body.Descendants<DocumentFormat.OpenXml.Wordprocessing.Paragraph>().Where(t => t.Descendants<Drawing>().Count() > 0).ToList();//DocumentFormat.OpenXml.Wordprocessing.Paragraph
                if (paragraphes.Count() > 0)
                {
                    for (int i = 0; i < paragraphes.Count(); i++)
                    {
                        var blip = paragraphes[i].Descendants<Blip>().FirstOrDefault();
                        if (null != blip)
                        {
                            PictureModel pm = new PictureModel();
                            //获取blip标签下面的Embed属性
                            pm.TheEmbed = blip.Embed;
                            //根据Embed属性所代表的id 找到所代表的ImagePart 
                            ImagePart imgpart = mainpart.GetPartById(blip.Embed) as ImagePart;
                            //Image img=Image.FromStream(imgpart.GetStream());
                            //根据所找到的Imagepart  找到里面的流
                            string contentType = imgpart.ContentType;
                            pm.PicturePath = SaveImage(DOI, contentType, i + 1, imgpart);
                            dmList.Add(pm);
                        }
                    }
                }

            }
            return dmList;

        }
        #endregion

        #region 1.0 根据DOI和图片在上下文中的位置创建图片的名字，注意不带后缀 +string CreateImgName(string DOI, int index)
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

            string dirpath = "E:\\Journal/image/art%3A" + arr[0] + "%2F" + arr[1] + "/MediaObjects/";
            if (!Directory.Exists(dirpath))
                Directory.CreateDirectory(dirpath);

            string imgName = dirpath + str + "Fig" + index + "_HTML";
            return imgName;
        }
        #endregion

        #region 2.0根据图片的ContentType 返回图片后缀 +string GetSuffix(string contentType)
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

        #region 3.0根据图片信息保存图片 并返回图片的完整名字 +string SaveImage(string DOI, string contentType, int imgindex, Image img)
        /// <summary>
        /// 根据图片信息保存图片 并返回图片的完整名字
        /// </summary>
        /// <param name="DOI">文章的DOI</param>
        /// <param name="contentType">图片的类型</param>
        /// <param name="imgindex">图片在文章中的位置</param>
        /// <param name="img">Image类的一个对象</param>
        /// <returns></returns>
        public string SaveImage(string DOI, string contentType, int imgindex, ImagePart imgpart)
        {
            string filenamewithoutsuffix = CreateImgName(DOI, imgindex);
            string suffix = GetSuffix(contentType);
            string filename = filenamewithoutsuffix + "." + suffix;
            Image img = Image.FromStream(imgpart.GetStream());
            img.Save(filename);
            return filename;
        }
        #endregion
    }
}
