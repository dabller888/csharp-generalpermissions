using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysUserConfiguration : EntityTypeConfiguration<SysUser> {
		public SysUserConfiguration() {
			// Primary Key
			this.HasKey(t => t.UserId);

			// Properties
			this.Property(t => t.UserId).IsRequired();
			this.Property(t => t.DeptId).IsRequired();
			this.Property(t => t.LoginName).IsRequired().HasMaxLength(64);
			this.Property(t => t.LoginPass).IsRequired().HasMaxLength(512);
			this.Property(t => t.RealName).IsRequired().HasMaxLength(20);
			this.Property(t => t.Sex).IsRequired().HasMaxLength(2);
			this.Property(t => t.BirthDate).IsRequired();
			this.Property(t => t.CreateTime).IsRequired();
			this.Property(t => t.LoginTime).IsRequired();
			this.Property(t => t.LastLoginTime).IsRequired();
			this.Property(t => t.LoginCount).IsRequired();
			this.Property(t => t.IsEnabled).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();
			this.Property(t => t.ExtendField1).IsRequired();
			this.Property(t => t.ExtendField2).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseSysUser");
			this.Property(t => t.UserId).HasColumnName("UserId");
			this.Property(t => t.DeptId).HasColumnName("DeptId");
			this.Property(t => t.LoginName).HasColumnName("LoginName");
			this.Property(t => t.LoginPass).HasColumnName("LoginPass");
			this.Property(t => t.RealName).HasColumnName("RealName");
			this.Property(t => t.Sex).HasColumnName("Sex");
			this.Property(t => t.BirthDate).HasColumnName("BirthDate");
			this.Property(t => t.Address).HasColumnName("Address");
			this.Property(t => t.Phone).HasColumnName("Phone");
			this.Property(t => t.Email).HasColumnName("Email");
			this.Property(t => t.CreateTime).HasColumnName("CreateTime");
			this.Property(t => t.LoginTime).HasColumnName("LoginTime");
			this.Property(t => t.LastLoginTime).HasColumnName("LastLoginTime");
			this.Property(t => t.LoginCount).HasColumnName("LoginCount");
			this.Property(t => t.IsEnabled).HasColumnName("IsEnabled");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
			this.Property(t => t.ExtendField1).HasColumnName("ExtendField1");
			this.Property(t => t.ExtendField2).HasColumnName("ExtendField2");
			this.Property(t => t.ExtendField3).HasColumnName("ExtendField3");
			this.Property(t => t.ExtendField4).HasColumnName("ExtendField4");
			this.Property(t => t.ExtendField5).HasColumnName("ExtendField5");
		}
    }
}
    
