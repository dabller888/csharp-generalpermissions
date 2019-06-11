using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysGroupService {
		private readonly SysGroupRepository dao = new SysGroupRepository();

        public int Add(SysGroup model) {
            return dao.Add(model);
        }

        public SysGroup Get(int GroupId) {
            return dao.GetEntity(m => m.GroupId == GroupId );
        }

        public SysGroup Get(Expression<Func<SysGroup,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysGroup model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysGroup() { GroupId = id });
            }
            return rows;
        }
        public List<SysGroup> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysGroup> GetPageList(SysGroupRequest query) {
            int total = 0;
            List<SysGroup> list = dao.GetListOrder(m => m.GroupId == query.GroupId , m => m.GroupId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
