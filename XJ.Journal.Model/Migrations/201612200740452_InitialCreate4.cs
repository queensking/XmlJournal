namespace XJ.Journal.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate4 : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.Issue", name: "Journals_Id", newName: "Journal_Id");
            RenameIndex(table: "dbo.Issue", name: "IX_Journals_Id", newName: "IX_Journal_Id");
            AddColumn("dbo.Article", "Issue_Id", c => c.Int());
            CreateIndex("dbo.Article", "Issue_Id");
            AddForeignKey("dbo.Article", "Issue_Id", "dbo.Issue", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Article", "Issue_Id", "dbo.Issue");
            DropIndex("dbo.Article", new[] { "Issue_Id" });
            DropColumn("dbo.Article", "Issue_Id");
            RenameIndex(table: "dbo.Issue", name: "IX_Journal_Id", newName: "IX_Journals_Id");
            RenameColumn(table: "dbo.Issue", name: "Journal_Id", newName: "Journals_Id");
        }
    }
}
