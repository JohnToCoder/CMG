﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CMG.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页</title>
    <link href="JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="JS/themes/icon.css" rel="stylesheet" type="text/css" />    
    <link href="JS/themes/index.css" rel="stylesheet" type="text/css" /> 
    <script src="JS/jquery-1.10.2.min.js" type="text/javascript"></script>  
    <script src="JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="JS/jquery.md5.js" type="text/javascript"></script>
   <%-- <script src="JS/validator.js" type="text/javascript"></script>--%>
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
                     
        #strChufa
        {
            width: 60px;
        }
        #strMudi
        {
            width: 60px;
        }
      
                    
    </style>  
</head>
<body>
      <div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
            <div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
                <img src="images/loading.gif" align="absmiddle" /> 网络加载中,请稍候...
            </div>
         </div>  
   
    <form id="form1" runat="server"> <%--onsubmit="return Validator.Validate(this.form,1);"--%> 
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
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">首    页</a>                       
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">个人资料</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">联系我们</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">帮    助</a>
                    </td>
                </tr>
                <tr>
                    <td style="width:320px; height:180px"> 
                         <table  border=0 cellpadding=0 cellspacing=0 style="width:380px; height:180px">
                            <tbody>
                                <tr>
                                    <td  height=30 colspan=3><label id="labErrorPN" runat=server visible=false style=" color:Red; font-style:oblique; font-size:medium;"> 输入的用户名或者密码错误！</label></td>
                                </tr>
                                <tr>
                                    <td height=30 width=60>用户名：</td>
                                    <td valign="middle" >
                                        <input runat=server name="txtUserName" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:135px; height:25px; vertical-align:middle;" type="text" id=txtUserName dataType="Require" msg="用户名不能为空" maxLength=16 />
                                    </td>
                                    <td >   
                                        <img alt='' src="images/ico_user.gif" width=19 height=18 />
                                    </td>               
                                </tr>
                                <tr>
                                    <td height=30 width=60>密    码：</td>
                                    <td  >
                                        <input runat=server name="txtPassWord" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:135px; height:25px; vertical-align:middle;" type=password id=txtPassWord dataType="Require" msg="密码不能为空" maxLength=16 />
                                    </td>
                                    <td >   
                                        <img alt='' src="images/luck.gif" width=19 height=18 />
                                    </td> 
                                </tr>                         
                                <tr>
                                    <td height=30 width=60>验证码：</td>
                                    <td  >                                        
                                        <input runat=server name="txtCode" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:135px; height:25px; vertical-align:middle;" type="text" title="看不清楚?点击图片切换" id="txtCode" maxLength=4  dataType="Require" msg="验证码不能为空" />&nbsp;                                                                
                                     </td>
                                     <td style="width:100px">                           
                                        <img alt='看不清，换一张' id="vcodoImg" src="../CheckCode.ashx?abc='+Math.random()" onerror="this.onerror=null;this.src='CheckCode.ashx?abc='+Math.random()" onclick="this.src='CheckCode.ashx?abc='+Math.random()" />
                                    </td>   
                                </tr>                             
                                <tr>
                                  
                                    <td colspan=3 height=30px align=center>
                                        
                                        <a id="btnLogin" runat="server" href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">登录</a>
                                        <input id="chkRemeber" type=checkbox name="chkRemember" style="margin-left:8px; vertical-align:middle;"/><label for="chkRemember" style="vertical-align:middle;">记住本次登录</label>
                                    </td>                                                                
                                </tr>
                                <tr>
                                    
                                    <td colspan=3 align="center"> 
                                        <a id="linkRegister" href="#" >如果没有账号，点击这里注册</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td rowspan=2 >
                        <table style=" margin-top:0px">
                        <tr><td style="width:560px;height:30px;">
                            <div id="Search" align=left >
                                <label >出发地：</label>
                                <input class="easyui-combobox" id="strChufa" name="出发地" data-options="valueField:'staID',textField:'staName',url:'ashx/getStation.ashx'">
                                <label >目的地：</label>
                                <input class="easyui-combobox" id="strMudi" name="目的地" data-options="valueField:'staID',textField:'staName',url:'ashx/getStation.ashx'">
                                <label >日期：</label>
                                <input class="easyui-datetimebox" id="strDate" data-options="showSeconds:false" value="" style="width:120px">
                                <a id="btnSearch" href="#" class="easyui-linkbutton" data-options="toggle:true">查找</a>
                            </div>
                            </td></tr>
                        <tr><td style="width:560px;height:420px;">                            
                                <div id=view class="easyui-panel" title="车票信息" style="padding:5px;"  data-options="fit:true,iconCls:'icon-save',collapsible:true,">
                                    <iframe id="Iframe1" name="subFrameIns" frameborder="0" src="../ListView.aspx" style="width: 100%; height: 100%;"></iframe>
                                </div>                            
                        </td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height:240px;"> 
                        <div id="note" class="easyui-panel" title="通知" style="padding:5px;"  data-options="fit:true,iconCls:'icon-save',collapsible:true,">
                            <iframe id="subFrameIns" name="subFrameIns" frameborder="0" src="../Note.aspx" style="width: 100%; height: 100%;"></iframe>
                         </div>
                    </td>
                </tr>
                <tr>
                    <td colspan=2 align=center style=" height:60px">
                        <label style=" font-size:medium; font-weight:bold; color:Black">毕业设计-</label>
                    </td>
                </tr>            
         </table>
     </div>
     <div id="WinIns" title="注册用户"  style="padding: 15px;background:#fafafa; width:99%;height:99%; display :none; overflow:hidden">
           <div region="center" border="false" style="background: #fff; border: 1px solid #ccc;width:98%;height:90%;">
                <table  border=0 cellpadding=0 cellspacing=0 style="width:380px; height:180px">
                            <tbody>                                
                                <tr>
                                    <td height=30 width=60>用户名：</td>
                                    <td valign="middle" colspan="2">
                                        <input runat=server name="txtUserName" value=''  id="rUserName"
                                        style="color:#ff0000; font-weight:bold; padding-left:5px; width:165px; height:25px; vertical-align:middle;" 
                                        type="text"  dataType="Require" msg="用户名不能为空" maxLength=16 />
                                    </td>                                                  
                                </tr>
                                <tr>
                                    <td height=30 width=60>密    码：</td>
                                    <td  colspan="2">
                                        <input runat=server name="txtPassWord" value='' id="rPassWord"
                                        style="color:#ff0000; font-weight:bold; padding-left:5px; width:165px; height:25px; vertical-align:middle;" 
                                        type="password"  dataType="Require" msg="密码不能为空" maxLength=16 />
                                    </td>
                                   
                                </tr> 
                                <tr>
                                    <td height=30 width=60>重复密码：</td>
                                    <td  colspan="2">
                                        <input  runat=server name="txtPassWord" value='' id="rRePassWord"
                                        style="color:#ff0000; font-weight:bold; padding-left:5px; width:165px; height:25px; vertical-align:middle;" 
                                        type="password"  dataType="Require" msg="密码不能为空" maxLength=16 />
                                    </td>                                   
                                </tr>  
                                <tr>
                                    <td height=30 width=60>手机号 ：</td>
                                    <td valign="middle" colspan="2">
                                        <input id="rMobile" runat=server name="txtUserName" value='' 
                                        style="color:#ff0000; font-weight:bold; padding-left:5px; width:165px; height:25px; vertical-align:middle;" 
                                        type="text"  dataType="Require" msg="手机号不能为空" maxLength=16 />
                                    </td>                                                  
                                </tr> 
                                <tr>
                                    <td height=30 width=60>邮    箱：</td>
                                    <td valign="middle" colspan="2" >
                                        <input id="rEmail" runat=server name="txtUserName" value='' 
                                        style="color:#ff0000; font-weight:bold; padding-left:5px; width:165px; height:25px; vertical-align:middle;" 
                                        type="text"  dataType="Require" msg="邮箱不能为空" maxLength=16 />
                                    </td>                                                  
                                </tr>                      
                                <tr>
                                    <td height=30 width=60>验证码：</td>
                                    <td  style="width:120px">                                        
                                        <input id="rImageCode" runat=server name="txtCode" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:105px; height:25px; vertical-align:middle;" type="text" title="看不清楚?点击图片切换"  maxLength=4  dataType="Require" msg="验证码不能为空" />&nbsp;                                                                
                                     </td>
                                     <td >                           
                                        <img alt='看不清，换一张' id="imgCode" src="../CheckCode.ashx?abc='+Math.random()" onerror="this.onerror=null;this.src='CheckCode.ashx?abc='+Math.random()" onclick="this.src='CheckCode.ashx?abc='+Math.random()" />
                                    </td>   
                                </tr>                             
                                
                            </tbody>
                        </table>
           </div> 
           <div region="south" border="false" style="text-align: center; vertical-align:middle; height: 25px; line-height: 25px;">                
                <table cellpadding="0" border="0" cellspacing="0" style="background: #fff; border: 0px solid #ccc;width:100%;">
                    <tr><td align="right" style="padding-top:5px;">
                             <a id="btnOK" href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">确定</a>
                        </td>
                         <td align="left" style="padding-left:15px;padding-top:5px;">
                             <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="toggle:true">取消</a>
                    </td></tr>
                 </table> 
           </div>    
    </div>
    </form>
</body>
</html>
