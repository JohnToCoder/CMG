<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CMG.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页</title>
    <link href="JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="JS/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="Images/style_login.css" rel="stylesheet" type="text/css" />
    <script src="JS/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="JS/jquery.min.js" type="text/javascript"></script>
    <script src="JS/jquery-ui.js" type="text/javascript"></script>
    <script src="JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="JS/validator.js" type="text/javascript"></script>
    <script src="JS/index.js" type="text/javascript"></script>    
     <script type="text/javascript">
         $(window).resize(function () {
             var width = $(window).width() - 10;
             var height = $(window).height() - 10;
             $('#cc').width(width);
             $('#cc').height(height);
             $('#cc').layout();   //窗口改变大小时加载  
         });
    </script>
    <style type="text/css">
        .style1
        {
            height: 119px;
        }
        .style2
        {
            width: 87px;
        }
        .style3
        {
            width: 129px;
        }
        .style4
        {
            width: 99px;
        }
        .style5
        {
            width: 562px;
        }
        .style6
        {
            width: 398px;
        }
    </style>
</head>
<body >
    <noscript>
        <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
            <img src="themes/default/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>       
   
    <form id="form1" runat="server" >
    <div id="cc" runat=server style=" width:100%; height:134%">
                <table align=center border=0 cellspacing=0 cellpadding=0 >
            <tbody>
                <tr>
                    <td colspan=3  background=images/login_bg.jpg class="style1">
                    </td>
                </tr>
               
                <tr>
                    <td valign=top style="border-left:dotted thin #cccccc;" class="style6">
                        <table class="cc06"  border=0 cellpadding=0 cellspacing=0>
                            <tbody>
                                <tr>
                                    <td  height=30 colspan=3><label id="Label1" runat=server visible=false style=" color:Red; font-style:oblique; font-size:medium;"> 输入的用户名或者密码错误！</label></td>
                                </tr>
                                <tr>
                                    <td height=30 class="style2">用户名：</td>
                                    <td valign="middle" class="style3" >
                                        <input runat=server name="txtUserName" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:125px; height:25px; vertical-align:middle;" type="text" id=Text1 dataType="Require" msg="用户名不能为空" maxLength=16 />
                                    </td>
                                    <td class="style4" >   
                                        <img alt='' src="images/ico_user.gif" width=19 height=18 />
                                    </td>               
                                </tr>
                                <tr>
                                    <td height=30 class="style2">密    码：</td>
                                    <td class="style3"  >
                                        <input runat=server name="txtPassWord" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:125px; height:25px; vertical-align:middle;" type=password id=Password1 dataType="Require" msg="密码不能为空" maxLength=16 />
                                    </td>
                                    <td class="style4" >   
                                        <img alt='' src="images/luck.gif" width=19 height=18 />
                                    </td> 
                                </tr>                         
                                <tr>
                                    <td height=30 class="style2">验证码：</td>
                                    <td class="style3"  >                                        
                                        <input runat=server name="txtCode" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:125px; height:25px; vertical-align:middle;" type="text" title="看不清楚?点击图片切换" id="Text2" maxLength=4  dataType="Require" msg="验证码不能为空" />&nbsp;                                                                
                                     </td>
                                     <td class="style4" >                           
                                        <img alt='看不清，换一张' id="Img1" src="about:blank" onerror="this.onerror=null;this.src='CheckCode.ashx?abc='+Math.random()" onclick="this.src='CheckCode.ashx?abc='+Math.random()" />
                                    </td>   
                                </tr>                             
                                <tr>
                                    
                                    <td colspan=3>
                                        <asp:Button runat=server class="button" ID="Button1" Text="登录" 
                                            OnClientClick="return Validator.Validate(this.form,1);" 
                                            Width="60px" />
                                        <input id="Checkbox1" type=checkbox name="chkRemember" 
                                            style="margin-left:40px; vertical-align:middle;"/><label for="chkRemember" style="vertical-align:middle;">记住本次登录</label>
                                    </td>                                                                
                                </tr>
                                <tr>
                                    <td class="style2" ></td>
                                    <td colspan=2> 
                                        <a id="A1" href="#" onclick="">如果没有账号，点击这里注册</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </td>                    
                    <td class=cc05></td>
                    <td height=500 valign=top class="style5" ></td>
                   
                </tr>
                <tr>
                    <td colspan=3 height=40  background=images/login_bg.jpg>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>
    </form>
</body>
</html>
