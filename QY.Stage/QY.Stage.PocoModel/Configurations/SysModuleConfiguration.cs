using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysModuleConfiguration : EntityTypeConfiguration<SysModule> {
		public SysModuleConfiguration() {
			// Primary Key
			this.HasKey(t => t.ModuleId);

			// Properties
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ModuleName).IsRequired().HasMaxLength(64);
			this.Property(t => t.ModulePId).IsRequired();
			this.Property(t => t.ModuleLever).IsRequired();
			this.Property(t => t.OrderNo).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseSysModule");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ModuleName).HasColumnName("ModuleName");
			this.Property(t => t.ModuleUrl).HasColumnName("ModuleUrl");
			this.Property(t => t.ModulePId).HasColumnName("ModulePId");
			this.Property(t => t.ModuleLever).HasColumnName("ModuleLever");
			this.Property(t => t.OrderNo).HasColumnName("OrderNo");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
		}
    }
}
    
