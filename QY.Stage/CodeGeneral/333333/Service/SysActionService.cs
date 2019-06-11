using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysActionService {
		private readonly SysActionRepository dao = new SysActionRepository();

        public int Add(SysAction model) {
            return dao.Add(model);
        }

        public SysAction Get(int ActionId) {
            return dao.GetEntity(m => m.ActionId == ActionId );
        }

        public SysAction Get(Expression<Func<SysAction,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysAction model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysAction() { ActionId = id });
            }
            return rows;
        }
        public List<SysAction> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysAction> GetPageList(SysActionRequest query) {
            int total = 0;
            List<SysAction> list = dao.GetListOrder(m => m.ActionId == query.ActionId , m => m.ActionId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
