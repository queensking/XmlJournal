namespace XJ.Journal.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate5 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Article", "Issue_Id", "dbo.Issue");
            DropForeignKey("dbo.Issue", "Journal_Id", "dbo.Journal");
            DropIndex("dbo.Article", new[] { "Issue_Id" });
            DropIndex("dbo.Issue", new[] { "Journal_Id" });
            AlterColumn("dbo.Article", "Issue_Id", c => c.Int(nullable: false));
            AlterColumn("dbo.Issue", "Journal_Id", c => c.Int(nullable: false));
            CreateIndex("dbo.Article", "Issue_Id");
            CreateIndex("dbo.Issue", "Journal_Id");
            AddForeignKey("dbo.Article", "Issue_Id", "dbo.Issue", "Id", cascadeDelete: true);
            AddForeignKey("dbo.Issue", "Journal_Id", "dbo.Journal", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Issue", "Journal_Id", "dbo.Journal");
            DropForeignKey("dbo.Article", "Issue_Id", "dbo.Issue");
            DropIndex("dbo.Issue", new[] { "Journal_Id" });
            DropIndex("dbo.Article", new[] { "Issue_Id" });
            AlterColumn("dbo.Issue", "Journal_Id", c => c.Int());
            AlterColumn("dbo.Article", "Issue_Id", c => c.Int());
            CreateIndex("dbo.Issue", "Journal_Id");
            CreateIndex("dbo.Article", "Issue_Id");
            AddForeignKey("dbo.Issue", "Journal_Id", "dbo.Journal", "Id");
            AddForeignKey("dbo.Article", "Issue_Id", "dbo.Issue", "Id");
        }
    }
}
