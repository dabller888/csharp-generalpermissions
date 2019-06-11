using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using QY.Stage.PocoModel;
using QY.Stage.Frameworks.DAL;

namespace QY.Stage.Frameworks.BLL {
    public partial class SysModuleService {
        private readonly SysModuleRepository moduleDao = new SysModuleRepository();
        
        private void MakeCycleTreeNode(List<SysModule> Modules,int PId,TreeNode Root) {
            var moduleNodes = Modules.Where(m => m.ModulePId == PId).ToList();
            List<TreeNode> nodes = new List<TreeNode>();
            foreach (var module in moduleNodes) {
                var node = new TreeNode();
                node.Id = module.ModuleId;
                node.Text = module.ModuleName;
                MakeCycleTreeNode(Modules, module.ModuleId, node);

                nodes.Add(node);
            }
            Root.Children = nodes;
        }
        
        public List<TreeNode> GetModuleTreeList() {
            List<SysModule> list = (from m in moduleDao.GetList(m => m.IsDeleted == 0)
                                    orderby m.ModuleLever ascending, m.OrderNo ascending
                                    select m).ToList();
            TreeNode root = new TreeNode();
            MakeCycleTreeNode(list,0, root);
            return root.Children;
        }
    }
}
