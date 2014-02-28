
$(function () {

    $('#btnSearch').bind('click', function () {
        getSearchList();
    });
    $('#btnLogin').bind('click', function () {
//        alert('test1');
        btnLoginClick();
    });
    $('#linkRegister').bind('click', function () {
        openWin();
    });
    $('#btnOK').bind('click', function () {
        $.messager.confirm('系统提示', '确定提交你的注册信息?',
            function (YesOrNO) {
                if (YesOrNO) {
                    addUser();
                }
            }
        );
    });
    $('#btnCancel').bind('click', function () {
        $('#WinIns').window('close');

    });
});

function openWin() {
    var left =0.5*( $(window).width())-50;
    $('#WinIns').window({
        width: 450,
        modal: true,
        shadow: true,
        closed: true,
        height: 300,
        top: 150,
        left: left,
        resizable: false,
        title: ' 新增窗口'
    });
    $('#WinIns').css("display", "block");
    $('#WinIns').window('open');
}
//新增用户注册
function addUser() {
    alert('新增用户');
}
//登陆按钮点击事件
function btnLoginClick() {
//    alert('test2');
    var strUserName = $('#txtUserName').val().toString();
    var strUerPW = $('#txtPassWord').val().toString();
    var strCode = $('#txtCode').val().toString();
    if (strUserName == '' || strUerPW == '' || strCode == '') {
        alert('请输入正确的用户名或者密码！'); //确认用户有输入并且在页面验证了用户输入正确
    }
//    alert('test3');
    //用户登陆post回传到服务端进行验证
    $.post("../ashx/LoginHandler.ashx?",
            {
                'rdItem':new Date().getTime(),
                'username': escape(strUserName),
                'pwd': $.md5(strUerPW),
                'code': escape(strCode)
            },
            function (ReturnValue) {
//                alert('test4');
                if (ReturnValue == "overtime") {
                    alert('驗證碼已過期');
                    $('#txtUserName').val('');
                    $('#txtPassWord').val('');
                    $('#txtCode').val('');
                }
                else if (ReturnValue == "ErrUser") {
                    alert("用户名或者密码错误！");
                }
                else if (ReturnValue == "CodeError") {
                    alert("验证码错误");
                    $('#txtUserName').val('');
                    $('#txtPassWord').val('');
                    $('#txtCode').val('');              
                }
                else if (ReturnValue == "UserSuccess") {
//                    alert('test5');
                    location.href = "../TabIndex.aspx";
                }
                
            });
}

//回车登陆
window.onload = function () {

    document.onkeydown = getKey;
}
function getKey(e) {
    e = e || window.event;
    var keycode = e.which ? e.which : e.keyCode;

    // alert(keycode);

    if (keycode == 13) {
        $('#btnLogin').bind('click', function () {
            //        alert('test1');
            btnLoginClick();
        });
    }
}
//初始化加载车次的查询信息
function InitListView() {
    $("#listview").empty();
    var tabist = "";
    $.post('ashx/getCheci.ashx', function (data) {        
        tablist = data;
        $("#listview").append(tablist);
    })
}
//获取查询信息，查询车次和车票信息返货结果
function getSearchList() {

    var strChufa = $('#strChufa').combobox('getValue').toString();
    var strMudi = $('#strMudi').combobox('getValue').toString();
    var strDateTime = $('#strDate').datetimebox('getValue').toString();
    var strDate=strDateTime.split(' ')[0].toString();
    var strYear = strDate.split('/')[2].toString()+'/'+strDate.split('/')[0].toString()+'/'+strDate.split('/')[1].toString();
    var strTime = strDateTime.split(' ')[1].toString();

    if (strChufa == "" || strMudi == "") {
        $.messager.alert('输入错误', '请选择出发地/目的地！','info');
    } else {
        var iFrameContent = $("#Iframe1").contents();
        iFrameContent.find("#listview").empty();
        var searchlist = "";
        $.post('ashx/getCheci.ashx', {'init':'1','chufa':strChufa,'mudi':strMudi,'date':strYear,'time':strTime}, function (data) {
            searchlist = data;
            iFrameContent.find("#listview").append(searchlist);
        })
    }
}