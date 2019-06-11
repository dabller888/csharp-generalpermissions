using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QY.Stage.PocoModel {
    public class TreeNode {
        public int Id { get; set; }
        public string Text { get; set; }
        public List<TreeNode> Children { get; set; }
    }
}
