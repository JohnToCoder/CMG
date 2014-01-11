
$(function () {
    InitDataGrid();  
    InitNote();
    $('#btnSearch').bind('click', function () {
        getSearchList();
    });
});

function InitNote() {
    $("#notelist").empty();
    var notelist = "";
    $.post('ashx/getNote.ashx', function (data) {        
        notelist = data;
        $("#notelist").append(notelist);
    })
    $("#notelist").accordion();    
}
function InitListDG() {
    $('#listdg').datagrid({
        fit: true, //自动大小   
        rownumbers: true, //行号   
        loadMsg: '数据装载中......',
        singleSelect: true, //单行选取  
        pagination: false, //显示分页 
        columns: [[
        { field: 'ID', title: 'ID', hidden: true, width: 20 },
        { field: 'CheID', title: '车次',  width: 20 },
        { field: 'ChufaName', title: '出发地',width: 60 },
        { field: 'ChufaID', title: 'ChufaID', hidden: true, width: 20 },
        { field: 'MudiName', title: '出发地', width: 60 },
        { field: 'MudiID', title: 'MudiID', hidden: true, width: 20 },
        { field: 'Piaoshu', title: '余票', align: 'left', width: 40 },
        { field: 'Time', title: '时间', align: 'left', width: 100 }
        ]],
        fitColumns: true
    });
    $.post('ashx/getCheCi.ashx',
        function (data) {
            $('#listdg').datagrid("loadData", data);
        }, 'json');
}
var strtxt = "";
function InitDataGrid() {
    $('#dg').datagrid({
        fit: true, //自动大小 
        //        url:'JS/data.json',   
        rownumbers: true, //行号   
        //loadMsg:'数据装载中......',    
        singleSelect: true, //单行选取  
        pagination: false, //显示分页 
        columns: [[
        { field: 'ID', title: 'ID', hidden: true, width: 20 },
        { field: 'Note', title: 'Note', hidden: true, width: 20 },
        { field: 'CreatDate', title: 'date', hidden: true, width: 20 },
        { field: 'Creator', title: 'Creator', hidden: true, width: 20 },
        { field: 'Title', title: '通知', align: 'left', width: 300,
            formatter: function (value, row, index) {
                strtxt = row.ID + '|' + row.Title + '|' + row.Note + '|' + row.CreatDate + '|' + row.Creator;
                //                alert(strtxt);
                return "<a href=\"javascript:void(0)\" onclick=\"titClick(" + row.ID + ")\">" + row.Title + "</a>";
            }
        }]],
        fitColumns: true
    });
    $.post('ashx/getNote.ashx',
        function (data) {
            $('#dg').datagrid("loadData", data);
        }, 'json'); 
}

function titClick(strID) {
    //    var tab = window.parent.document.getDocumentById('tabs');
    //    alert(strID);
    var lID = strtxt.split('|')[1].toString();
    var lNote = strtxt.split('|')[2].toString();
    var lDate = strtxt.split('|')[3].toString();

    $('#labID').text(lID);
    $('#txtNote').text(lNote);
    $('#labDate').text(lDate);
    $('#winNote').window('open');    
}

function getSearchList() {
    //alert("chaxun");
    var strChufa = $('#strChufa').combobox('getValue').toString();
    var strMudi = $('#strMudi').combobox('getValue').toString();
    var strDateTime = $('#strDate').datetimebox('getValue').toString();
    var strDate=strDateTime.split(' ')[0].toString();
    var strYear = strDate.split('/')[2].toString()+'/'+strDate.split('/')[0].toString()+'/'+strDate.split('/')[1].toString();
    var strTime = strDateTime.split(' ')[1].toString();
    //alert(strChufa+' '+strMudi);
    if (strChufa == "" || strMudi == "") {
        $.messager.alert('输入错误', '请选择出发地/目的地！','info');
    } else {
        alert("chaxun");
    }
}