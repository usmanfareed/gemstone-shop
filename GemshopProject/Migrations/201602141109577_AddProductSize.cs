namespace GemshopProject.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddProductSize : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "size", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "size");
        }
    }
}
