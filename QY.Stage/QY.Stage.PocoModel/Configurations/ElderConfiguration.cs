using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration;
namespace QY.Stage.PocoModel.Configurations {
    public class ElderConfiguration : EntityTypeConfiguration<Elder> {
		public ElderConfiguration() {
			// Primary Key
			this.HasKey(t => t.ElderId);

			// Properties
			this.Property(t => t.ElderId).IsRequired();
			this.Property(t => t.SerialNo).IsRequired().HasMaxLength(16);
			this.Property(t => t.ElderName).IsRequired().HasMaxLength(64);
			this.Property(t => t.Sex).IsRequired();
			this.Property(t => t.Age).IsRequired();
			this.Property(t => t.FirstName).IsRequired().HasMaxLength(64);
			this.Property(t => t.FirstSex).IsRequired();
			this.Property(t => t.FirstAddr).IsRequired().HasMaxLength(1024);
			this.Property(t => t.FirstPhone).IsRequired().HasMaxLength(11);
			this.Property(t => t.FirstRelation).IsRequired();
			this.Property(t => t.IsEnable).IsRequired();
			this.Property(t => t.IsDelete).IsRequired();

			// Table && Column Mappings
			this.ToTable("Elder");
			this.Property(t => t.ElderId).HasColumnName("ElderId");
			this.Property(t => t.SerialNo).HasColumnName("SerialNo");
			this.Property(t => t.ElderName).HasColumnName("ElderName");
			this.Property(t => t.Sex).HasColumnName("Sex");
			this.Property(t => t.Age).HasColumnName("Age");
			this.Property(t => t.Addr).HasColumnName("Addr");
			this.Property(t => t.Post).HasColumnName("Post");
			this.Property(t => t.Phone).HasColumnName("Phone");
			this.Property(t => t.Content).HasColumnName("Content");
			this.Property(t => t.QRCode).HasColumnName("QRCode");
			this.Property(t => t.FirstName).HasColumnName("FirstName");
			this.Property(t => t.FirstSex).HasColumnName("FirstSex");
			this.Property(t => t.FirstAddr).HasColumnName("FirstAddr");
			this.Property(t => t.FirstPost).HasColumnName("FirstPost");
			this.Property(t => t.FirstPhone).HasColumnName("FirstPhone");
			this.Property(t => t.FirstRelation).HasColumnName("FirstRelation");
			this.Property(t => t.IsEnable).HasColumnName("IsEnable");
			this.Property(t => t.IsDelete).HasColumnName("IsDelete");
		}
    }
}
    
