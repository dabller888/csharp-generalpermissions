

CREATE svw_function AS 
  select 
    bi_function.fId AS FunctionID,
    bi_function.functionName AS Description,
    bi_function.functionType AS functionType,
    bi_function.functionId AS FID,
    bi_function.functionName AS functionName,
    bi_function.UIPath AS UIPath,
    bi_function.functionClass AS functionClass,
    bi_function.returnPath AS returnPath 
  from 
    bi_function;



CREATE VIEW svw_goodsunit AS 
  select 
    bi_goods.goodsId AS goodsId,
    getUnitStr(bi_goods.goodsId) AS unit_string,
    getUnitRateStr(bi_goods.goodsId) AS rate_string,
    getUnitRate(bi_goods.goodsId) AS maxToMinRate 
  from 
    bi_goods;


CREATE VIEW svw_menu AS 
  select 
    a.menuId AS menuId,
    b.parentNode AS parentId,
    a.menuName AS menuname,
    a.functionId AS functionId,
    a.url AS url,
    a.menuType AS type,
    b.nodeType AS nodeType,
    b.validFlag AS validFlag 
  from 
    (bi_menu a join st_treecomposite b) 
  where 
    ((b.treeName = _gbk'menu') and (a.menuId = b.nodeId));



CREATE wf_department AS 
  select 
    sa_organizetree.OrgID AS departmentId,
    sa_organizetree.OrgName AS departmentName,
    sa_organizetree.ParentOrgID AS parentId,
    sa_organizetree.AuditFlag AS AuditFlag 
  from 
    sa_organizetree;



CREATE VIEW wf_role AS 
  select 
    sa_role.RoleID AS RoleID,
    sa_role.RoleName AS RoleName,
    sa_role.OrgId AS departmentId 
  from 
    sa_role;



CREATE VIEW wf_serialno AS 
  select 
    max(wf_todotasklist.serialNo) AS serialNo,
    max(wf_todotasklist.taskId) AS taskId 
  from 
    wf_todotasklist union 
  select 
    max(wf_havedonetasks.serialNo) AS serialNo,
    max(wf_havedonetasks.taskId) AS taskId 
  from 
    wf_havedonetasks;


CREATE  VIEW wf_user AS 
  select 
    sa_user.UserID AS UserID,
    sa_user.UserName AS UserName,
    sa_user.LogonStatus AS logonFlag,
    sa_user.OrgId AS departmentId,
    0 AS onLeaveFlag 
  from 
    sa_user;



CREATE VIEW wf_userrole AS 
  select 
    a.RoleID AS RoleID,
    a.UserID AS UserID,
    0 AS priorityNum,
    0 AS granteFlag,
    0 AS granteeId,
    0 AS roundRobinToken 
  from 
    (sa_userrole a join sa_user b) 
  where 
    ((a.UserID = b.UserID) and (b.ManageFlag <> _gbk'RemoveUser'));


