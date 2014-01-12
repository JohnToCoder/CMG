<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="CMG.ListView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="JS/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#listview").empty();
            var tabist = "";
            $.post('ashx/getCheci.ashx',{'init': '0'}, function (data) {
                tablist = data;
                $("#listview").append(tablist);
            })
        });
    </script>
    <style type="text/css">
        th
        {
            border-right:2px dotted #ccddff;
	        font-size:15px;
	        font-weight:normal;
	        background:#fafafa url('../../gray/images/datagrid_header_bg.gif') repeat-x left bottom;
	        border-bottom:1px dotted #ccc;
	        border-top:1px dotted #fff;  
	        color: #4f6b72; 
        }  
        td {  
            border: 1px solid #ccddff;             
            font-size:13px;  
            padding: 1px 1px 1px 1px;  
            color: #4f6b72;  
        } 
    </style>
</head>
<body>
    
    <div id=listview>
    
    </div>
   
</body>
</html>
