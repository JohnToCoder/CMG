$(function () {
    $('#btnSearch').bind('click', function () {
        var strChufa = $('#strChufa').combobox('getValue').toString();
        var strMudi = $('#strMudi').combobox('getValue').toString();
        var strDateTime = $('#strDate').datetimebox('getValue').toString();
        var strDate = strDateTime.split(' ')[0].toString();
        var strYear = strDate.split('/')[2].toString() + '/' + strDate.split('/')[0].toString() + '/' + strDate.split('/')[1].toString();
        var strTime = strDateTime.split(' ')[1].toString();
        //        alert("SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime);
        location.href = '../Admin/CheCiAdmin.aspx?' + "SearchKey=" + strChufa + '=' + strMudi + '=' + strYear + '=' + strTime;
    });
    $('#btnEdit').bind('click', function () {
        $.messager.confirm('系统提示', '确定修改此项内容?',
            function (YesOrNO) {
                if (YesOrNO) {
                    alert('xiugai');
                }
            }
        );
    });
});

function editCheCi(strID, strCheID, strChufaID, strMudiID, strPiaoShu, strCheDate, strCheTime) {
//    alert(strID + strCheID + strChufaID + strMudiID + strPiaoShu + strCheDate + strCheTime);
    $('#ID').val(strID);
    $('#txtCheCi').val(strCheID);
    $('#txteditChufa').combobox('setValue',strChufaID);
    $('#txteditMudi').combobox('setValue', strMudiID);
    $('#txtPiaoShu').val(strPiaoShu);
    $('#txtDate').datebox("setValue", strCheDate);
    $('#txtTime').val(strCheTime);
}