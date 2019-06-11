using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class UserModuleConfiguration : EntityTypeConfiguration<UserModule> {
		public UserModuleConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.UserId, t.ModuleId });

			// Properties
			this.Property(t => t.UserId).IsRequired();
			this.Property(t => t.ModuleId).IsRequired();
			this.Property(t => t.ActionId).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseUserModule");
			this.Property(t => t.UserId).HasColumnName("UserId");
			this.Property(t => t.ModuleId).HasColumnName("ModuleId");
			this.Property(t => t.ActionId).HasColumnName("ActionId");
		}
    }
}
    
