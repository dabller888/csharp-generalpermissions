using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysDepartmentService {
		private readonly SysDepartmentRepository dao = new SysDepartmentRepository();

        public int Add(SysDepartment model) {
            return dao.Add(model);
        }

        public SysDepartment Get(int DeptId) {
            return dao.GetEntity(m => m.DeptId == DeptId );
        }

        public SysDepartment Get(Expression<Func<SysDepartment,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysDepartment model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysDepartment() { DeptId = id });
            }
            return rows;
        }
        public List<SysDepartment> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysDepartment> GetPageList(SysDepartmentRequest query) {
            int total = 0;
            List<SysDepartment> list = dao.GetListOrder(m => m.DeptId == query.DeptId , m => m.DeptId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
