using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class UserRoleConfiguration : EntityTypeConfiguration<UserRole> {
		public UserRoleConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.UserId, t.RoleId });

			// Properties
			this.Property(t => t.UserId).IsRequired();
			this.Property(t => t.RoleId).IsRequired();

			// Table && Column Mappings
			this.ToTable("UserRole");
			this.Property(t => t.UserId).HasColumnName("UserId");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
		}
    }
}
    
