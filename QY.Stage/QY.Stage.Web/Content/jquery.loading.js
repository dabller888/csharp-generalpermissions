//采用jquery easyui loading css效果   
mask = {
    open: function () {
        $("<div class=\"datagrid-mask\"></div>").css({
            display: "block",
            width: "100%",
            height: $(window).height()
        }).appendTo("body");
        $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候。。。").appendTo("body").css({
            display: "block",
            left: ($(document.body).outerWidth(true) - 190) / 2,
            top: ($(window).height() - 45) / 2
        });
    },
    close: function () {
        $(".datagrid-mask").remove();
        $(".datagrid-mask-msg").remove();
    }
}