//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Xj.MSSQL.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Article
    {
        public int Id { get; set; }
        public int IId { get; set; }
        public string DOI { get; set; }
        public string AName { get; set; }
        public string PageIndex { get; set; }
        public string Html { get; set; }
        public System.DateTime ReceivedDate { get; set; }
        public System.DateTime AcceptedDate { get; set; }
        public System.DateTime PublishedDate { get; set; }
    }
}
