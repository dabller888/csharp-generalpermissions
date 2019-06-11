using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysDepartmentConfiguration : EntityTypeConfiguration<SysDepartment> {
		public SysDepartmentConfiguration() {
			// Primary Key
			this.HasKey(t => t.DeptId);

			// Properties
			this.Property(t => t.DeptId).IsRequired();
			this.Property(t => t.DepartName).IsRequired().HasMaxLength(64);
			this.Property(t => t.DeptPId).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseSysDepartment");
			this.Property(t => t.DeptId).HasColumnName("DeptId");
			this.Property(t => t.DepartName).HasColumnName("DepartName");
			this.Property(t => t.DeptPId).HasColumnName("DeptPId");
			this.Property(t => t.DepartDesc).HasColumnName("DepartDesc");
		}
    }
}
    
