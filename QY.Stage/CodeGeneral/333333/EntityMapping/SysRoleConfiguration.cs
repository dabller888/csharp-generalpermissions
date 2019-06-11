using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysRoleConfiguration : EntityTypeConfiguration<SysRole> {
		public SysRoleConfiguration() {
			// Primary Key
			this.HasKey(t => t.RoleId);

			// Properties
			this.Property(t => t.RoleId).IsRequired();
			this.Property(t => t.RolePId).IsRequired();
			this.Property(t => t.RoleName).IsRequired().HasMaxLength(64);
			this.Property(t => t.CreateTime).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();

			// Table && Column Mappings
			this.ToTable("SysRole");
			this.Property(t => t.RoleId).HasColumnName("RoleId");
			this.Property(t => t.RolePId).HasColumnName("RolePId");
			this.Property(t => t.RoleName).HasColumnName("RoleName");
			this.Property(t => t.CreateTime).HasColumnName("CreateTime");
			this.Property(t => t.RoleDesc).HasColumnName("RoleDesc");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
		}
    }
}
    
