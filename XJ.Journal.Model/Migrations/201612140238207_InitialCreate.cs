namespace XJ.Journal.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Affiliation",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AffiliationName = c.String(nullable: false, maxLength: 512),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Article",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Doi = c.String(),
                        ArticleName = c.String(),
                        PageRange = c.String(),
                        Html = c.String(),
                        ReceiveDate = c.DateTime(nullable: false),
                        AcceptDate = c.DateTime(nullable: false),
                        PublishedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Author",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AuthorName = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Issue",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        IssueName = c.String(nullable: false, maxLength: 128),
                        PublishDate = c.DateTime(nullable: false),
                        Journals_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Journal", t => t.Journals_Id)
                .Index(t => t.Journals_Id);
            
            CreateTable(
                "dbo.Journal",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        JournalName = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ArticleAffiliation",
                c => new
                    {
                        Article_Id = c.Int(nullable: false),
                        Affiliation_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Article_Id, t.Affiliation_Id })
                .ForeignKey("dbo.Article", t => t.Article_Id, cascadeDelete: true)
                .ForeignKey("dbo.Affiliation", t => t.Affiliation_Id, cascadeDelete: true)
                .Index(t => t.Article_Id)
                .Index(t => t.Affiliation_Id);
            
            CreateTable(
                "dbo.AuthorArticle",
                c => new
                    {
                        Author_Id = c.Int(nullable: false),
                        Article_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Author_Id, t.Article_Id })
                .ForeignKey("dbo.Author", t => t.Author_Id, cascadeDelete: true)
                .ForeignKey("dbo.Article", t => t.Article_Id, cascadeDelete: true)
                .Index(t => t.Author_Id)
                .Index(t => t.Article_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Issue", "Journals_Id", "dbo.Journal");
            DropForeignKey("dbo.AuthorArticle", "Article_Id", "dbo.Article");
            DropForeignKey("dbo.AuthorArticle", "Author_Id", "dbo.Author");
            DropForeignKey("dbo.ArticleAffiliation", "Affiliation_Id", "dbo.Affiliation");
            DropForeignKey("dbo.ArticleAffiliation", "Article_Id", "dbo.Article");
            DropIndex("dbo.AuthorArticle", new[] { "Article_Id" });
            DropIndex("dbo.AuthorArticle", new[] { "Author_Id" });
            DropIndex("dbo.ArticleAffiliation", new[] { "Affiliation_Id" });
            DropIndex("dbo.ArticleAffiliation", new[] { "Article_Id" });
            DropIndex("dbo.Issue", new[] { "Journals_Id" });
            DropTable("dbo.AuthorArticle");
            DropTable("dbo.ArticleAffiliation");
            DropTable("dbo.Journal");
            DropTable("dbo.Issue");
            DropTable("dbo.Author");
            DropTable("dbo.Article");
            DropTable("dbo.Affiliation");
        }
    }
}
