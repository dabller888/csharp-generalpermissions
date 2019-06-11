using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysLogService {
		private readonly SysLogRepository dao = new SysLogRepository();

        public int Add(SysLog model) {
            return dao.Add(model);
        }

        public SysLog Get(int LogId) {
            return dao.GetEntity(m => m.LogId == LogId );
        }

        public SysLog Get(Expression<Func<SysLog,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysLog model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysLog() { LogId = id });
            }
            return rows;
        }
        public List<SysLog> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysLog> GetPageList(SysLogRequest query) {
            int total = 0;
            List<SysLog> list = dao.GetListOrder(m => m.LogId == query.LogId , m => m.LogId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
