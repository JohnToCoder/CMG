$(function () {
    $('#btnSearch').bind('click', function () {
        var strChufa = $('#strChufa').combobox('getValue').toString();
        var strMudi = $('#strMudi').combobox('getValue').toString();
        var strDateTime = $('#strDate').datetimebox('getValue').toString();
        var strDate = strDateTime.split(' ')[0].toString();
        var strYear = strDate.split('/')[2].toString() + '/' + strDate.split('/')[0].toString() + '/' + strDate.split('/')[1].toString();
        var strTime = strDateTime.split(' ')[1].toString();
        //        alert("SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime);
        location.href = '../User/ChePiaoUser.aspx?' + "SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime;
    });
    $('#btnDingpiao').bind('click', function () {
        addDingPiao();
    });
    $('#btnTuipiao').bind('click', function () {
        deleteDingPiao();
    });
});

function editCheCi(strID, strCheID, strChufaID, strMudiID, strPiaoShu, strPiaoJia, strDingPiaoShu,strCheDate, strCheTime) {
    //    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);
    $('#ID').val(strID);
    $('#txtCheCi').val(strCheID);
    $('#txteditChufa').combobox('setValue', strChufaID);
    $('#txteditMudi').combobox('setValue', strMudiID);
    $('#txtDingPiaoShu').val(strDingPiaoShu);
    $('#txtPiaoJia').val(strPiaoJia);
    $('#txtDate').datebox("setValue", strCheDate);    
    $('#txtTime').val(strCheTime);
}
function addDingPiao() {
    var straddID = $('#ID').val().toString();
    var straddCheID = $('#txtCheCi').val().toString();
    var straddChufaID = $('#txteditChufa').combobox('getValue').toString();
    var straddMudiID = $('#txteditMudi').combobox('getValue').toString();
    var straddDingPiaoShu = $('#txtDingPiaoShu').val().toString();
    var straddPiaoJia = $('#txtPiaoJia').val().toString();
    var straddCheDate = $('#txtDate').datebox("getValue").toString();
    var straddCheTime = $('#txtTime').val().toString();
    if (straddCheID == '' || straddChufaID == '' || straddMudiID == '' || straddDingPiaoShu || straddPiaoJia == '') {
        $.messager.alert("新增错误", "请填好新增项目内容！", "warning");
    } else {
        $.post('../ashx/editCheCi.ashx',
        {
            'flag': 'add',
            'CheID': straddID,
            'CheCi': straddCheID,
            'ChufaID': straddChufaID,
            'MudiID': straddMudiID,
            'DingPiaoShu': straddDingPiaoShu,
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

    $.post('../ashx/editChePiaoUser.ashx',
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