using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Journal.Model.Models
{
    public class Article
    {
        public Article()
        {
            Affialiations = new HashSet<Affiliation>();
            Authors = new HashSet<Author>();
        }
        //文章Id
        public int Id { get; set; }
        public string Doi { get; set; }
        public string ArticleName { get; set; }

        //文章在杂志里面的页面范围
        public string PageRange { get; set; }

        //xslt处理生成的html内容
        public string Html { get; set; }
        public DateTime ReceiveDate { get; set; }

        public DateTime AcceptDate { get; set; }
        public DateTime PublishedDate { get; set; }

        public virtual ICollection<Author> Authors { get; set; }
        public virtual ICollection<Affiliation> Affialiations { get; set; }

        [Required]
        public virtual Issue Issue { get; set; }

    }
}
