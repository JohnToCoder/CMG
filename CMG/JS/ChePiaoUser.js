$(function () {
    $('#btnSearch').bind('click', function () {
        var strSCheCi = $('#strSCheCi').combobox('getValue').toString();
        var strSUser = $('#strSUser').combobox('getValue').toString();
        var strDateTime = $('#strDate').datetimebox('getValue').toString();
        var strDate = strDateTime.split(' ')[0].toString();
        var strYear = strDate.split('/')[2].toString() + '/' + strDate.split('/')[0].toString() + '/' + strDate.split('/')[1].toString();
        var strTime = strDateTime.split(' ')[1].toString();
        //        alert("SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime);
        location.href = '../Admin/ChePiaoUser.aspx?' + "SearchKey=" + strSCheCi + '=' + strSUser + '=' + strYear + '=' + strTime;
    });

    $('#btnDelete').bind('click', function () {
        deleteDingPiao();
    });
});

function viewUser(strUsersID, strUserID, strUserName, strTypeName, strUserTel, strUserEmail) {
    //    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);

    $('#txtUserID').val(strUserID);
    $('#txtUserName').val(strUserName);
    $('#txtType').val(strTypeName);
    $('#txtTell').val(strUserTel);
    $('#txtEmail').val(strUserEmail);
}

function deleteDingPiao() {
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

    $.post('../ashx/editChePiao.ashx',
        {
            'flag': 'delete',
            'delID': strdelID
        },
        function (Return) {
            if (Return == "OK") {
                alert("删除车次成功！");
                location.reload();
            }
        }
    );
}