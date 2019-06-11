
(function ($) {
    //判断dom是否存在
    $.fn.exist = function () {
        if ($(this).length >= 1) {
            return true;
        }
        return false;
    };
    //密码强度检测
    $.fn.passwdSecurityLevel = function () {
        /**
        * var aStr = ["弱", "中", "强", "牛逼"];
        * [!,@,#,$,%,^,&,*,?,_,~,-,(,)]
        * 1. 密码少于5位——弱密码
        * 2. 密码只由数字、小写字母、大写字母或其它特殊符号当中的一种组成——弱密码
        * 3. 密码由数字、小写字母、大写字母或其它特殊符号当中的两种组成——中度安全密码
        * 4. 密码由数字、小写字母、大写字母或其它特殊符号当中的三种以上组成——比较安全的密码
        **/
        var level = 0;
        if ($(this).length < 6) return 0;
        if (/\d/.test($(this))) level++;
        if (/[a-z]/.test($(this))) level++;
        if (/[A-Z]/.test($(this))) level++;
        if (/\W/.test($(this))) level++;
        if ($(this).length > 12) return 4;
        return level;
    };
})(jQuery);