using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Data.Entity;
using QY.Stage.PocoModel;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
namespace QY.Stage.Frameworks.DAL {
    public class ElderRepository : BaseRepository<Elder> {
        public string GetLastSerialNo() {
            DbRawSqlQuery<Elder> elders = base.ExecuteQuery(@"select * from Elder order by SerialNo desc ", new Object[] { });
            return elders.FirstOrDefault() == null ? "" : elders.FirstOrDefault().SerialNo;
        }

        public bool setElderQRCode(int ElderId, string QRCode) {
            return base.ExcuteNoQuery(@"update Elder set QRCode=@QRCode where ElderId=@ElderId ", new SqlParameter[]{
                new SqlParameter("@ElderId",ElderId),
                new SqlParameter("@QRCode",QRCode)
            });
        }
    }
}    
