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
		private readonly ElderRepository elderDao = new ElderRepository();

        public string GetLastSerialNo() {
            return elderDao.GetLastSerialNo();
        }

        public bool setElderQRCode(int ElderId, string QRCode) {
            return elderDao.setElderQRCode(ElderId,QRCode);
        }
    }
}    
