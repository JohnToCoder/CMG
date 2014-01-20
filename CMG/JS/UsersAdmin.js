$(function () {
    $('#btnSearch').bind('click', function () {
        var strSUserID = $('#strSUserID').combobox('getValue').toString();
        var strSUserName = $('#strSUserName').combobox('getValue').toString();
        location.href = '../Admin/UsersAdmin.aspx?' + "SearchKey=" + strSUserID + '=' + strSUserName ;
    });
    $('#btnEdit').bind('click', function () {
        $.messager.confirm('系统提示', '确定修改此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    updateUsers();
                }
            }
        );
    });
    $('#btnMiMa').bind('click', function () {
        $.messager.confirm('系统提示', '确定重置用户密码?',
            function (YesOrNO) {
                if (YesOrNO) {
                    updatePassWord();
                }
            }
        );
    });
    $('#btnAdd').bind('click', function () {
        $.messager.confirm('系统提示', '确定增加此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    addUsers();
                }
            }
        );
    });
    $('#btnDelete').bind('click', function () {
        deleteUsers();
    });
});

function editUsers(strID, strUserID, strUserName, strUserType, strTypeName, strUserTel, strUserEmail,strUserPW) {
    //    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);
    $('#ID').val(strID);
    $('#txtUserID').val(strUserID);
    $('#txtUserName').val(strUserName);
    $('#txtType').combobox('setValue', strUserType);
    $('#txtTell').val(strUserTel);
    $('#txtEmail').val(strUserEmail);
    $('#txtPassWord').val(strUserPW);
}
function updateUsers() {
    var strupID = $('#ID').val().toString();
    var strupUserID = $('#txtUserID').val().toString();
    var strupUserName = $('#txtUserName').val().toString();
    var strupUserType = $('#txtType').combobox('getValue').toString();
    var strupUserTell = $('#txtTell').val().toString();
    var strupUserEmail = $('#txtEmail').val().toString();
   
    if (strupID == '') {
        $.messager.alert("修改错误", "请选择修改项目！", "warning");
    } else {
        $.post('../ashx/editUsers.ashx',
        {
            'flag': 'update',
            'ID': strupID,
            'UserID': strupUserID,
            'UserName': strupUserName,
            'UserType': strupUserType,
            'UserTell': strupUserTell,
            'UserEmail': strupUserEmail
        },
        function (Return) {
            if (Return == "OK") {
                $.messager.alert("修改成功", "已更新数据库中该用户资料！", "warning");
                location.reload();
            }
        }
    );
    }
}
function updatePassWord() {
    var strupID = $('#ID').val().toString();
    var strupMima = $('#txtMima').val().toString();
    if (strupID == '') {
        $.messager.alert("修改错误", "请选择修改项目！", "warning");
    } else {
        $.post('../ashx/editUsers.ashx',
        {
            'flag': 'reset',
            'ID': strupID,
            'Mima': $.md5(strupMima)        
        },
        function (Return) {
            if (Return == "OK") {
                $.messager.alert("修改成功", "已重置该用户密码！", "warning");
                location.reload();
            }
        }
    );
    }
}
function addUsers() {
    var straddUserID = $('#txtUserID').val().toString();
    var straddUserName = $('#txtUserName').val().toString();
    var straddUserType = $('#txtType').combobox('getValue').toString();
    var straddUserTell = $('#txtTell').val().toString();
    var straddUserEmail = $('#txtEmail').val().toString();

    if (straddUserID == '' || straddUserName == '' || straddUserType == '' ) {
        $.messager.alert("新增错误", "请填好新增项目内容！", "warning");
    } else {
        $.post('../ashx/editUsers.ashx',
        {
            'flag': 'add',
            'UserID': straddUserID,
            'UserName': straddUserName,
            'UserType': straddUserType,
            'UserTell': straddUserTell,
            'UserEmail': straddUserEmail
        },
        function (Return) {
            if (Return == "OK") {
                $.messager.alert("新增成功", "新增加用户成功！", "warning");
                location.reload();
            }
        }
    );
    }
}

function deleteUsers() {
    var chk = $('tbody>tr>td').find(':checkbox')
    var chked = chk.filter(':checked');

    if (chked.length == 0) {
        $.messager.alert("删除错误", "请选择删除项目！", "warning");
    }
    else {

        $.messager.confirm('系统提示', '您確定刪除嗎?',
                                            function (YesOrNO) {

                                                if (YesOrNO) {
                                                    getKeyValue(chked);
                                                }
                                            }
                                       );
    }
}

function getKeyValue(strChked) {
    var strdelID = strChked[0].parentNode.nextSibling.innerHTML;
    for (i = 1; i < strChked.length; i++) {
        strdelID += "-" + strChked[i].parentNode.nextSibling.innerHTML;
    }

    $.post('../ashx/editUsers.ashx',
        {
            'flag': 'delete',
            'delID': strdelID
        },
        function (Return) {
            if (Return == "OK") {
                $.messager.alert("删除成功", "已删除该用户资料！", "warning");
                location.reload();
            }
        }
    );
}