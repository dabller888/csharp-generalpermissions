using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysActionConfiguration : EntityTypeConfiguration<SysAction> {
		public SysActionConfiguration() {
			// Primary Key
			this.HasKey(t => t.ActionId);

			// Properties
			this.Property(t => t.ActionId).IsRequired();
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ActionName).IsRequired().HasMaxLength(128);
			this.Property(t => t.ActionType).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseSysAction");
			this.Property(t => t.ActionId).HasColumnName("ActionId");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ActionName).HasColumnName("ActionName");
			this.Property(t => t.ActionCode).HasColumnName("ActionCode");
			this.Property(t => t.ButtonCode).HasColumnName("ButtonCode");
			this.Property(t => t.ParaName).HasColumnName("ParaName");
			this.Property(t => t.ActionType).HasColumnName("ActionType");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
		}
    }
}
    
