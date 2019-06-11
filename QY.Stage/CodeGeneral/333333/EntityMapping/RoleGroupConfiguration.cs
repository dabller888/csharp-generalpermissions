using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class RoleGroupConfiguration : EntityTypeConfiguration<RoleGroup> {
		public RoleGroupConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.RoleId, t.GroupId });

			// Properties
			this.Property(t => t.RoleId).IsRequired();
			this.Property(t => t.GroupId).IsRequired();

			// Table && Column Mappings
			this.ToTable("RoleGroup");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
		}
    }
}
    
