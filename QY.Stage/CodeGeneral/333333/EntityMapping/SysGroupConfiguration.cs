using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysGroupConfiguration : EntityTypeConfiguration<SysGroup> {
		public SysGroupConfiguration() {
			// Primary Key
			this.HasKey(t => t.GroupId);

			// Properties
			this.Property(t => t.GroupId).IsRequired();
			this.Property(t => t.GroupName).IsRequired().HasMaxLength(64);
			this.Property(t => t.GroupPId).IsRequired();
			this.Property(t => t.CreateTime).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();

			// Table && Column Mappings
			this.ToTable("SysGroup");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
			this.Property(t => t.GroupName).HasColumnName("GroupName");
			this.Property(t => t.GroupPId).HasColumnName("GroupPId");
			this.Property(t => t.CreateTime).HasColumnName("CreateTime");
			this.Property(t => t.GroupDesc).HasColumnName("GroupDesc");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
		}
    }
}
    
