<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CMG.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页</title>
    <link href="JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="JS/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="JS/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="JS/jquery.min.js" type="text/javascript"></script>
    <script src="JS/jquery-ui.js" type="text/javascript"></script>
    <script src="JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="JS/validator.js" type="text/javascript"></script>
    <script src="JS/index.js" type="text/javascript"></script>
    <script type="text/javascript">
        function getPX() {
            document.getElementById("px").value = window.screen.width + "?" + window.screen.height;
        }  
     </script> 
</head>
<body onload='getPX()'>
    <noscript>
        <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
            <img src="themes/default/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>       
   
    <form id="form1" runat="server" onsubmit="return Validator.Validate(this.form,1);">
    
    <div class="easyui-layout" style="width:700px;height:350px;">
        <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div>
        <div data-options="region:'east',split:true" title="East" style="width:180px;"></div>
        <div data-options="region:'west',split:true" title="West" style="width:100px;"></div>
        <div data-options="region:'center',iconCls:'icon-ok'" title="Center">
            <div class="easyui-layout" data-options="fit:true">
                <div data-options="region:'north',split:true,border:false" style="height:50px"></div>
                <div data-options="region:'west',split:true,border:false" style="width:100px"></div>
                <div data-options="region:'center',border:false"></div>
            </div>
        </div>
    </div>
   
    </form>
</body>
</html>
