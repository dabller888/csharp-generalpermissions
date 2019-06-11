using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QY.Stage.ViewModel {
    public class PageRequest {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int TotalCount { get; set; }
    }
}
