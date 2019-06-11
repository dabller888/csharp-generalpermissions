using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class RoleModuleConfiguration : EntityTypeConfiguration<RoleModule> {
		public RoleModuleConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.RoleId, t.ModuleId, t.ActionId });

			// Properties
			this.Property(t => t.RoleId).IsRequired();
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ActionId).IsRequired();

			// Table && Column Mappings
			this.ToTable("RoleModule");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ActionId).HasColumnName("ActionId");
		}
    }
}
    
