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

function editCheCi(strID,strCheCiID, strCheID, strChufaID, strMudiID, strPiaoShu, strPiaoJia, strDingPiaoShu,strYuPiao,strCheDate, strCheTime) {
    //    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);
    $('#ID').val(strID);
    $('#txtCheCiID').val(strCheCiID);
    $('#txtCheCi').val(strCheID);
    $('#txteditChufa').combobox('setValue', strChufaID);
    $('#txteditMudi').combobox('setValue', strMudiID);   
    $('#txtPiaoJia').val(strPiaoJia);
    $('#txtDate').datebox("setValue", strCheDate);
    $('#txtTime').val(strCheTime);
    if (strYuPiao == '') {
        $('#txtYuPiao').val(strPiaoShu);
    }
    else {
        $('#txtYuPiao').val(strYuPiao);
    }
    $('#txtPiaoShu').val(strPiaoShu);
    $('#txtDingPiaoShu').val(strDingPiaoShu);
}
function addDingPiao() {
    var straddID = $('#ID').val().toString();
    var straddCheCiID = $('#txtCheCiID').val().toString(); 
    var straddDingPiaoShu = $('#txtDingPiaoShu').val().toString();
    var straddYuPiao = $('#txtYuPiao').val().toString();
    
    if (straddDingPiaoShu =='') {
        $.messager.alert("新增错误", "请填好新增项目内容！", "warning");
    } else if ((parseInt(straddYuPiao) - parseInt(straddDingPiaoShu)) < 0) {
        $.messager.alert("新增错误", "余票不足！", "warning");
    }
    else {
        $.post('../ashx/editChePiaoUser.ashx',
        {
            'flag': 'add',
            'CheCiID': straddCheCiID,           
            'DingPiaoShu': straddDingPiaoShu,
            'YuPiao':(parseInt(straddYuPiao) - parseInt(straddDingPiaoShu)).toString()
          },
        function (Return) {
            if (Return == "OK") {
                alert("订票成功！");
                location.href="../User/ChePiaoUser.aspx";
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
    var straddCheCiID = $('#txtCheCiID').val().toString(); 
    var straddDingPiaoShu = $('#txtDingPiaoShu').val().toString();
    var straddYuPiao = $('#txtYuPiao').val().toString();
    $.post('../ashx/editChePiaoUser.ashx',
        {
            'flag': 'delete',
            'delID': strdelID,
            'CheCiID': straddCheCiID, 
            'YuPiao': (parseInt(straddYuPiao) + parseInt(straddDingPiaoShu)).toString()
        },
        function (Return) {
            if (Return == "OK") {
                alert("删除车次成功！");
                location.reload();
            }
        }
    );
}