using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class GroupUserConfiguration : EntityTypeConfiguration<GroupUser> {
		public GroupUserConfiguration() {
			// Primary Key
			this.HasKey(t => new { t.GroupId, t.UserId });

			// Properties
			this.Property(t => t.GroupId).IsRequired();
			this.Property(t => t.UserId).IsRequired();

			// Table && Column Mappings
			this.ToTable("GroupUser");
			this.Property(t => t.GroupId).HasColumnName("GroupId");
			this.Property(t => t.UserId).HasColumnName("UserId");
		}
    }
}
    
