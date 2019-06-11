using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class UserGroupConfiguration : EntityTypeConfiguration<UserGroup> {
		public UserGroupConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.UserId, t.GroupId });

			// Properties
			this.Property(t => t.UserId).IsRequired();
			this.Property(t => t.GroupId).IsRequired();

			// Table && Column Mappings
			this.ToTable("UserGroup");
			this.Property(t => t.UserId).HasColumnName("UserId");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
		}
    }
}
    
