using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Xj.CommonModel
{
    public class ArticleAffiliationModel
    {
        public int ViewId { get; set; }
        public int AffiliationID { get; set; }

        public string AffiliationText { get; set; }
    }

    public class ArticleAffiliationAuthor
    {
        public List<int> AffiliationViewIds { get; set; }

        //public int AuthorId { get; set; }
        public string AuthorName { get; set; }

        public int AuthorType { get; set; }

        //通讯作者的邮箱,为null则代表不是通信作者
        public string Email { get; set; }
    }

    public class HeaderInfo
    {
        public List<ArticleAffiliationAuthor> AAAList { get; set; }
        public string Doi { get; set; }
        public string Jname { get; set; }

        public string Iyear { get; set; }

        //代表期刊是多少期
        public string Iname { get; set; }

        public string Pageindex { get; set; }

        public string ReceivedDate { get; set; }

        public string AcceptedDate { get; set; }

        public string PublishedDate { get; set; }


    
    }

    public class ArticleAffiliationAuthorInfo
    {
        public string AuthorInfo { get; set; }

        public string AffiliationInfo { get; set; }

        public string publishedYear { get; set; }

        
    
    }

}
