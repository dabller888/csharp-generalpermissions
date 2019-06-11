using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class RoleUserConfiguration : EntityTypeConfiguration<RoleUser> {
		public RoleUserConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.RoleId, t.UserId });

			// Properties
			this.Property(t => t.RoleId).IsRequired();
			this.Property(t => t.UserId).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseRoleUser");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
			this.Property(t => t.UserId).HasColumnName("UserId");
		}
    }
}
    
