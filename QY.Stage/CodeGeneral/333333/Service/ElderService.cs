using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class ElderService {
		private readonly ElderRepository dao = new ElderRepository();

        public int Add(Elder model) {
            return dao.Add(model);
        }

        public Elder Get(int ElderId) {
            return dao.GetEntity(m => m.ElderId == ElderId );
        }

        public Elder Get(Expression<Func<Elder,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(Elder model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new Elder() { ElderId = id });
            }
            return rows;
        }
        public List<Elder> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<Elder> GetPageList(ElderRequest query) {
            int total = 0;
            List<Elder> list = dao.GetListOrder(m => m.ElderId == query.ElderId , m => m.ElderId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
