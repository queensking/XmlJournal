namespace XJ.Journal.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Author", "ArticleId", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Author", "ArticleId");
        }
    }
}
