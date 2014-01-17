<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TabIndex.aspx.cs" Inherits="CMG.TabIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户</title>
    <link href="JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="JS/themes/icon.css" rel="stylesheet" type="text/css" />   
    <script src="JS/jquery-1.10.2.min.js" type="text/javascript"></script>  
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
            window.location.reload();
        });
         
    </script>    
    <style type="text/css">  
        table {  
            border: 1px solid #ccddff;  
            padding:0;   
            margin:0 auto;  
            border-collapse: collapse;            
        }  
        
       td {  
            border: 1px solid #ccddff;             
            font-size:12px;  
            padding: 1px 1px 1px 1px;  
            color: #4f6b72;  
        } 
        
    </style>  
</head>
<body>
      <div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
            <div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
                <img src="images/loading.gif" align="absmiddle" /> 网络加载中,请稍候...
            </div>
         </div>  
   
    <form id="form1" runat="server" onsubmit="return Validator.Validate(this.form,1);" >
    <div id="cc"  style=" width:100%;height:100%; ">        
         
            <table runat=server id="tabMain"   style=" width:900px;height:700px; ">
            
                <tr>
                    <td colspan=3 align=right style=" background-image:url('images/login_bg.jpg'); background-repeat:repeat; height:120px;">
                        <img alt="标题" src="Images/biaoti.png" style="margin-right:140px;"/>
                        <img alt="二维码" src="Images/erweima.png" style= "height:120px; width:120px; margin-right:20px" />
                    </td>
                </tr>
                <tr> 
                    <td colspan=3 align=right style=" background-image:url('images/login_bg.jpg');background-repeat:repeat; height:30px" >
                        <a href="../Index.aspx" class="easyui-linkbutton" data-options="toggle:true">首    页</a>                       
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">个人资料</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">联系我们</a>
                        <span id="interface_bt1" style=" margin:20px"><a href='loginout.aspx'><img alt="" src="images/logout.gif" onclick="return confirm('确认：您确认要安全注销，退出登录吗？')" border="0" title="安全注销，退出登陆" align=absmiddle/></a></span> 
                    </td>
                </tr>  
                <tr>
                    <td style="width:900px; height:460px"> 
                        <div id="main" runat=server style="width:890px; height:440px">
                            <iframe id="tabIframe" name="subFrameIns" frameborder="0" src="../MenuTab.aspx" style="width: 100%; height: 100%;"></iframe>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td  align=center style=" height:60px">
                        <label style=" font-size:medium; font-weight:bold; color:Black">毕业设计-</label>
                    </td>
                </tr>            
         </table>
     </div>

    </form>
</body>
</html>
