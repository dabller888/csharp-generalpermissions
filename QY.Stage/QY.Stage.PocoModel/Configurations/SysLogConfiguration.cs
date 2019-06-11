using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class SysLogConfiguration : EntityTypeConfiguration<SysLog> {
		public SysLogConfiguration() {
			// Primary Key
			this.HasKey(t => t.LogId);

			// Properties
			this.Property(t => t.LogId).IsRequired();
			this.Property(t => t.OperType).IsRequired();
			this.Property(t => t.UserId).IsRequired();
			this.Property(t => t.OperTime).IsRequired();
			this.Property(t => t.IsDeleted).IsRequired();

			// Table && Column Mappings
            this.ToTable("BaseSysLog");
			this.Property(t => t.LogId).HasColumnName("LogId");
			this.Property(t => t.OperType).HasColumnName("OperType");
			this.Property(t => t.LogDesc).HasColumnName("LogDesc");
			this.Property(t => t.UserId).HasColumnName("UserId");
			this.Property(t => t.IPAddress).HasColumnName("IPAddress");
			this.Property(t => t.MacAddress).HasColumnName("MacAddress");
			this.Property(t => t.OperTime).HasColumnName("OperTime");
			this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");
		}
    }
}
    
