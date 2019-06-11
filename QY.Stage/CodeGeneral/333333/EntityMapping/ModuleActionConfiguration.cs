using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class ModuleActionConfiguration : EntityTypeConfiguration<ModuleAction> {
		public ModuleActionConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.ModuleActionId, t.ModuleId, t.ActionId });

			// Properties
			this.Property(t => t.ModuleActionId).IsRequired();
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ActionId).IsRequired();

			// Table && Column Mappings
			this.ToTable("ModuleAction");
			this.Property(t => t.ModuleActionId).HasColumnName("ModuleActionId");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ActionId).HasColumnName("ActionId");
		}
    }
}
    
