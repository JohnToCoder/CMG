
$(document).ready(function () {
   
    $('#btnSearch').bind('click', function () {
        getSearchList();
    });
    $('#btnLogin').bind('click', function () {
        btnLoginClick();
    });
});

function btnLoginClick() {
    var strUserName = $('#txtUserName').val().toString();
    var strUerPW = $('#txtPassWord').val().toString();
    var strCode = $('#txtCode').val().toString();
  
    $.post("../ashx/LoginHandler.ashx",
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
                    return;
                }
                else if (ReturnValue == "ErrUser") {
                    alert("用户名或者密码错误！");
                    return;
                }
                else if (ReturnValue == "CodeError") {
                    alert("验证码错误");
                    $('#txtUserName').val('');
                    $('#txtPassWord').val('');
                    $('#txtCode').val('');
                    return;                 
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