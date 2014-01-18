$(function () {
    $('#btnSearch').bind('click', function () {
        var strChufa = $('#strChufa').combobox('getValue').toString();
        var strMudi = $('#strMudi').combobox('getValue').toString();
        var strDateTime = $('#strDate').datetimebox('getValue').toString();
        var strDate = strDateTime.split(' ')[0].toString();
        var strYear = strDate.split('/')[2].toString() + '/' + strDate.split('/')[0].toString() + '/' + strDate.split('/')[1].toString();
        var strTime = strDateTime.split(' ')[1].toString();
        //        alert("SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime);
        location.href = '../Admin/ChePiaoAdmin.aspx?' + "SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime;
    });
    $('#btnEdit').bind('click', function () {
        $.messager.confirm('系统提示', '确定修改此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    updateCheCi();
                }
            }
        );
    });
    $('#btnAdd').bind('click', function () {
        $.messager.confirm('系统提示', '确定增加此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    addCheCi();
                }
            }
        );
    });
    $('#btnDelete').bind('click', function () {
        deleteCheCi();
    });
});

function editCheCi(strID, strCheID, strChufaID, strMudiID, strPiaoShu, strPiaoJia, strCheDate, strCheTime) {
    //    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);
    $('#ID').val(strID);
    $('#txtCheCi').val(strCheID);
    $('#txteditChufa').combobox('setValue', strChufaID);
    $('#txteditMudi').combobox('setValue', strMudiID);
    $('#txtPiaoShu').val(strPiaoShu);
    $('#txtPiaoJia').val(strPiaoJia);
    $('#txtDate').datebox("setValue", strCheDate);
    $('#txtTime').val(strCheTime);
}
function updateCheCi() {
    var strupID = $('#ID').val().toString();
    var strupCheID = $('#txtCheCi').val().toString();
    var strupChufaID = $('#txteditChufa').combobox('getValue').toString();
    var strupMudiID = $('#txteditMudi').combobox('getValue').toString();
    var strupPiaoShu = $('#txtPiaoShu').val().toString();
    var strupPiaoJia = $('#txtPiaoJia').val().toString();
    var strupCheDate = $('#txtDate').datebox("getValue").toString();
    var strupCheTime = $('#txtTime').val().toString();
    if (strupID == '') {
        $.messager.alert("修改错误", "请选择修改项目！", "warning");
    } else {
        $.post('../ashx/editCheCi.ashx',
        {
            'flag': 'update',
            'CheID': strupID,
            'CheCi': strupCheID,
            'ChufaID': strupChufaID,
            'MudiID': strupMudiID,
            'PiaoShu': strupPiaoShu,
            'PiaoJia': strupPiaoJia,
            'CheDate': strupCheDate,
            'CheTime': strupCheTime
        },
        function (Return) {
            if (Return == "OK") {
                alert("修改成功！");
                location.reload();
            }
        }
    );
    }
}
function addCheCi() {
    var straddID = $('#ID').val().toString();
    var straddCheID = $('#txtCheCi').val().toString();
    var straddChufaID = $('#txteditChufa').combobox('getValue').toString();
    var straddMudiID = $('#txteditMudi').combobox('getValue').toString();
    var straddPiaoShu = $('#txtPiaoShu').val().toString();
    var straddPiaoJia = $('#txtPiaoJia').val().toString();
    var straddCheDate = $('#txtDate').datebox("getValue").toString();
    var straddCheTime = $('#txtTime').val().toString();
    if (straddCheID == '' || straddChufaID == '' || straddMudiID == '' || straddPiaoShu || straddPiaoJia == '') {
        $.messager.alert("新增错误", "请填好新增项目内容！", "warning");
    } else {
        $.post('../ashx/editCheCi.ashx',
        {
            'flag': 'add',
            'CheID': straddID,
            'CheCi': straddCheID,
            'ChufaID': straddChufaID,
            'MudiID': straddMudiID,
            'PiaoShu': straddPiaoShu,
            'PiaoJia': straddPiaoJia,
            'CheDate': straddCheDate,
            'CheTime': straddCheTime
        },
        function (Return) {
            if (Return == "OK") {
                alert("新增车次成功！");
                location.reload();
            }
        }
    );
    }
}

function deleteCheCi() {
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

    $.post('../ashx/editCheCi.ashx',
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