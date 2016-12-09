using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Rash.Common
{
    public class ReferenceOperator
    {
        public void ReplaceTables(string filename)
        {
            using (WordprocessingDocument doc = WordprocessingDocument.Open(filename, true))
            {
                List<string> strMarks = new List<string>();
                var bookmarks = doc.MainDocumentPart.Document.Body.Descendants<BookmarkStart>().ToList();
                foreach (var bookmark in bookmarks)
                {
                    //如果书签的名字不为null和空字符串
                    if (!string.IsNullOrEmpty(bookmark.Name))
                    {
                        //如果书签的Name属性值 以_Ref字符串开头 将类似 _Ref463699409 的字符串存入字符串数组中
                        if (bookmark.Name.ToString().StartsWith("_Ref"))
                        {
                            strMarks.Add(bookmark.Name);
                        
                        }
                        
                    }
                    
                }
                for (int i = 0; i < strMarks.Count; i++)
                {

                }
            }
        }
    }
}
