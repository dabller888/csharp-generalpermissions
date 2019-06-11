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
            //lambda方式条件拼接（注：可以写一个LambdaToSQL方法）
            //http://www.cnblogs.com/linxingxunyan/p/6245396.html
            // Expression<Func<T, bool>>拼接查询条件：http://blog.csdn.net/sunho89/article/details/50857715
            //性能问题：http://www.cnblogs.com/yxlblogs/p/3513255.html
            /*
            示例1            
              var predicate = PredicateBuilder.True<Gift>();       
              predicate = predicate.And(w => w.DataState == DataStateEnum.正常);   
              List<Gift> list = db.Gifts.Where(predicate);
            */

            Expression<Func<Elder, bool>> expression = (m => m.ElderName.Contains(query.ElderName) && m.FirstName.Contains(query.FirstName) && m.FirstPhone.Contains(query.FirstPhone));
            if (!string.IsNullOrEmpty(query.SerialNo)) {
                expression = expression.And(m => m.SerialNo.Contains(query.SerialNo));
            }
            if (query.SecPost != "全部") {
                expression = expression.And(m => m.SecPost.Contains(query.SecPost));
            }

            List<Elder> list = dao.GetListOrder(expression,
                                                m => m.ElderId, 
                                                true, 
                                                query.PageSize, 
                                                query.PageIndex, 
                                                out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
