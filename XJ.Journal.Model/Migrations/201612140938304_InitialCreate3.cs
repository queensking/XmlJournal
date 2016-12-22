namespace XJ.Journal.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate3 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Author", "ArticleId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Author", "ArticleId", c => c.Int(nullable: false));
        }
    }
}
