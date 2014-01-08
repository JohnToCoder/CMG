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
    <script src="JS/jquery.md5.js" type="text/javascript"></script>
    <script src="JS/validator.js" type="text/javascript"></script>
    <script src="JS/index.js" type="text/javascript"></script>    
    <script type="text/javascript">
         window.onload = function () { $('#loading-mask').fadeOut(); }
         $(window).resize(function () {
             var width = $(window).width() - 10;
             var height = $(window).height() - 10;
             $('#cc').width(width);
             $('#cc').height(height);
             $('#cc').layout();   //窗口改变大小时加载  
         });
         
    </script>    
</head>
<body style="background-color:#ffffff;">
    <noscript style="margin-bottom: 0px; margin-top: 15px;">
        <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
            <img src="Images/ico_products.gif" " alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>       
    <div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
            <div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
                <img src="images/loading.gif" align="absmiddle" /> 网络加载中,请稍候...
            </div>
         </div>
    <form id="form1" runat="server" >
    <div id="cc" style=" width:100%; height:100%">        
         
            <table runat=server id="tabMain" style=" width:800px;height:600px; border:1px; border-bottom-color:#f6f6f6;">
            
                <tr>
                    <td colspan=3  style="background:images/login_bg.jpg; width:780px; height:100px">
                    </td>
                </tr>
                <tr> 
                    <td colspan=3  style="background:images/login_bg.jpg; width:780px; height:60px">
                    </td>
                </tr>
                <tr>
                    <td style="height:120px"></td>
                    <td rowspan=2 style=" height:400px"></td>
                </tr>
                <tr>
                    <td style="height:180px"> </td>
                </tr>
                <tr>
                    <td colspan=2 style=" height:40px"></td>
                </tr>            
         </table>
     </div>
    
    </form>
</body>
</html>
