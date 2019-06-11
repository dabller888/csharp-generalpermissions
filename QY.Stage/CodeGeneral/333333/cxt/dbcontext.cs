using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using QY.Stage.PocoModel;
using QY.Stage.PocoModel.Configurations;

namespace QY.Stage.Frameworks.DAL { 
	public class DbContextBase : DbContext {
        public DbContextBase() : base("name=AppContext") { }
		public DbSet<SysDepartment> SysDepartment { get; set; }
        public DbSet<SysLog> SysLog { get; set; }
        public DbSet<SysAction> SysAction { get; set; }
        public DbSet<SysModule> SysModule { get; set; }
        public DbSet<ModuleAction> ModuleAction { get; set; }
        public DbSet<SysGroup> SysGroup { get; set; }
        public DbSet<GroupUser> GroupUser { get; set; }
        public DbSet<GroupRole> GroupRole { get; set; }
        public DbSet<GroupModule> GroupModule { get; set; }
        public DbSet<SysRole> SysRole { get; set; }
        public DbSet<RoleUser> RoleUser { get; set; }
        public DbSet<RoleGroup> RoleGroup { get; set; }
        public DbSet<RoleModule> RoleModule { get; set; }
        public DbSet<UserRole> UserRole { get; set; }
        public DbSet<UserGroup> UserGroup { get; set; }
        public DbSet<UserModule> UserModule { get; set; }
        public DbSet<SysUser> SysUser { get; set; }
        public DbSet<Elder> Elder { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            Database.SetInitializer<DbContextBase>(null);
			modelBuilder.Configurations.Add(new SysDepartmentConfiguration());
            modelBuilder.Configurations.Add(new SysLogConfiguration());
            modelBuilder.Configurations.Add(new SysActionConfiguration());
            modelBuilder.Configurations.Add(new SysModuleConfiguration());
            modelBuilder.Configurations.Add(new ModuleActionConfiguration());
            modelBuilder.Configurations.Add(new SysGroupConfiguration());
            modelBuilder.Configurations.Add(new GroupUserConfiguration());
            modelBuilder.Configurations.Add(new GroupRoleConfiguration());
            modelBuilder.Configurations.Add(new GroupModuleConfiguration());
            modelBuilder.Configurations.Add(new SysRoleConfiguration());
            modelBuilder.Configurations.Add(new RoleUserConfiguration());
            modelBuilder.Configurations.Add(new RoleGroupConfiguration());
            modelBuilder.Configurations.Add(new RoleModuleConfiguration());
            modelBuilder.Configurations.Add(new UserRoleConfiguration());
            modelBuilder.Configurations.Add(new UserGroupConfiguration());
            modelBuilder.Configurations.Add(new UserModuleConfiguration());
            modelBuilder.Configurations.Add(new SysUserConfiguration());
            modelBuilder.Configurations.Add(new ElderConfiguration());
            base.OnModelCreating(modelBuilder);
        }
    }
}