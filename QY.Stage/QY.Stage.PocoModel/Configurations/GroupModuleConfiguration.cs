using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class GroupModuleConfiguration : EntityTypeConfiguration<GroupModule> {
		public GroupModuleConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.GroupId, t.ModuleId, t.ActionId });

			// Properties
			this.Property(t => t.GroupId).IsRequired();
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ActionId).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseGroupModule");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ActionId).HasColumnName("ActionId");
		}
    }
}
    
