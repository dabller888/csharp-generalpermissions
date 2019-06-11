$(function () {
    user = {
        renderActions: function (userActions, actions) {
            //隐藏功能区
            var str = '', btnStr = '';
            for (var i in actions) {
                str += actions[i].ButtonCode + ',';
                if ($('#' + actions[i].ButtonCode).exist()) {
                    if (actions[i].ButtonCode.toLowerCase().indexOf('btnsearch') >= 0) {
                        $('#' + actions[i].ButtonCode + 'Dlg').hide();
                    }
                    $('#' + actions[i].ButtonCode).hide();
                }
            }
            btnStr = str.toLowerCase();
            //显示用户的功能
            for (var j in userActions) {
                if (btnStr.indexOf(userActions[j].ButtonCode.toLowerCase()) >= 0) {
                    if (btnStr.indexOf('btnsearch') >= 0) {
                        $('#' + userActions[j].ButtonCode + 'Dlg').show();
                    }
                    $('#' + userActions[j].ButtonCode).show();
                    //$(".datagrid-toolbar [id ='"+actions[j].ButtonCode+"']").eq(0).hide();
                }
            }
        }
    }
})