using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace XJ.Journal.Model.Models
{
    public class XmlJournalContext : DbContext
    {
        public XmlJournalContext():base("con")
        {
            //Database.SetInitializer(new CreateDatabaseIfNotExists<XmlJournalContext>());默认是这种方式建立数据库 
        }
        public DbSet<Article> Articles { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Journal> Journals { get; set; }
        public DbSet<Issue> Issues { get; set; }
        public DbSet<Affiliation> Affiliations { get; set; }

        /// OnModelCreating方法中的modelBuilder.Conventions.Remove语句禁止表名称正在多元化。
        /// 如果你不这样做，所生成的表将命名为Students、Courses和Enrollments。相反，
        /// 表名称将是Student、Course和Enrollment。开发商不同意关于表名称应该多数。
        /// 本教程使用的是单数形式，但重要的一点是，您可以选择哪个你更喜欢通过包括或省略这行代码的形式。
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();        
        }
    }
}
