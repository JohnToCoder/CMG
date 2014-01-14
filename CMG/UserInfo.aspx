<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="CMG.UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人资料</title>
     <style type="text/css">  
        table {  
            border: 1px solid #ccddff;  
            padding:0;   
            margin:0 auto;  
            border-collapse: collapse;            
        }  
        
       td {  
            border: 1px solid #ccddff;             
            font-size:15px;  
            padding: 1px 1px 1px 1px;  
            color: #4f6b72;  
        }                   
           
                    
    </style>  
</head>
<body>
    <form id="form1" runat="server">
    <div id="cc">
        <table  border=0 cellpadding=0 cellspacing=0 style=" height:220px">
                
                <tr>
                    <td height=25 width=100 align=right>用户ID：</td>
                        <td width=140 >
                            <label id=labuid runat=server></label>
                        </td>
                    </tr>
                <tr>
                    <td height=25 width=100 align=right>用户名：</td>
                    <td width=120 >
                        <label id=labuname runat=server></label>
                    </td>
                       
                </tr>
                <tr>
                    <td height=25 width=100 align=right>密码：</td>
                    <td  >
                        <input runat=server name="txtPassWord" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:135px; height:25px; vertical-align:middle;" type=password id=txtPassWord dataType="Require" msg="密码不能为空" maxLength=16 />
                    </td>
                    
                </tr>                         
                <tr>
                    <td height=25 width=100 align=right>验证码：</td>
                    <td  >                                        
                        <input runat=server name="txtCode" value='' style="color:#ff0000; font-weight:bold; padding-left:5px; width:135px; height:25px; vertical-align:middle;" type="text" title="看不清楚?点击图片切换" id="txtCode" maxLength=4  dataType="Require" msg="验证码不能为空" />&nbsp;                                                                
                     </td>
                       
                </tr>                       
                            
        </table>
    </div>
    </form>
</body>
</html>
