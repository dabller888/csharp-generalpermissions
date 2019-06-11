using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class GroupRoleConfiguration : EntityTypeConfiguration<GroupRole> {
		public GroupRoleConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.GroupId, t.RoleId });

			// Properties
			this.Property(t => t.GroupId).IsRequired();
			this.Property(t => t.RoleId).IsRequired();

			// Table && Column Mappings
			this.ToTable("GroupRole");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
		}
    }
}
    
