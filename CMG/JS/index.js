
$(function () {

    $('#btnSearch').bind('click', function () {
        getSearchList();
    });
    $('#btnLogin').bind('click', function () {  
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
    $('#WinIns').window({
        width: 650,
        modal: true,
        shadow: true,
        closed: true,
        height: 480,
        top: 100,
        left: 150,
        resizable: false,
        title: ' 新增窗口'
    });
    $('#WinIns').css("display", "block");
    $('#WinIns').window('open');
}

function btnLoginClick() {
    
    var strUserName = $('#txtUserName').val().toString();
    var strUerPW = $('#txtPassWord').val().toString();
    var strCode = $('#txtCode').val().toString();
    if (strUserName == '' || strUerPW == '' || strCode == '') {
        alert('请输入正确的用户名或者密码！');
    }
    $.post("../ashx/LoginHandler.ashx?rdItem="+new Date().getTime(),
            {
                'username': escape(strUserName),
                'pwd': $.md5(strUerPW),
                'code': escape(strCode)
            },
            function (ReturnValue) {
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
                    
                    location.href = "../TabIndex.aspx";
                }
                
            });
}


window.onload = function () {

    document.onkeydown = getKey;
}

function getKey(e) {
    e = e || window.event;
    var keycode = e.which ? e.which : e.keyCode;

    // alert(keycode);

    if (keycode == 13) {
        $('#btnLogin').trigger('click');
    }
}
function InitListView() {
    $("#listview").empty();
    var tabist = "";
    $.post('ashx/getCheci.ashx', function (data) {        
        tablist = data;
        $("#listview").append(tablist);
    })   
}
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