<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListCheci.aspx.cs" Inherits="CMG.ListCheci" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车次</title>
    <link href="JS/themes/icon.css" rel="stylesheet" type="text/css" />    
    <link href="JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <script src="JS/jquery.min.js" type="text/javascript"></script>
    <script src="JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dg').datagrid({
                fit: true, //自动大小   
                rownumbers: true, //行号   
//                loadMsg: '数据装载中......',
                singleSelect: true, //单行选取  
                pagination: true, //显示分页 
                columns: [[
                    { field: 'ID', title: 'ID', hidden: true, width: 20 },
                    { field: 'CheID', title: '车次', width: 20 },
                    { field: 'ChufaName', title: '出发地', width: 60 },
                    { field: 'ChufaID', title: 'ChufaID', hidden: true, width: 20 },
                    { field: 'MudiName', title: '出发地', width: 60 },
                    { field: 'MudiID', title: 'MudiID', hidden: true, width: 20 },
                    { field: 'PiaoShu', title: '余票', align: 'left', width: 40 },
                    { field: 'Time', title: '时间', align: 'left', width: 100 }
                    ]]               
            });
            $.post('ashx/getCheCi.ashx',
                function (data) {
                    $('#dg').datagrid("loadData", data);
                }, 'json');
        });
    </script>
</head>
<body>  
   
    <table id="dg"></table>
  
</body>
</html>
