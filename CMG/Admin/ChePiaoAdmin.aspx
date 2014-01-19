<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChePiaoAdmin.aspx.cs" Inherits="CMG.Admin.ChePiaoAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>车票管理</title>

    <link href="../JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../JS/themes/icon.css" rel="stylesheet" type="text/css" />    
    <link href="../JS/themes/index.css" rel="stylesheet" type="text/css" />      
    <link href="../JS/GvStyle.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.10.2.min.js" type="text/javascript"></script>  
    <script src="../JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../JS/validator.js" type="text/javascript"></script>
    <script src="../JS/ChePiaoAdmin.js" type="text/javascript"></script>
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
            font-size:12px;  
            padding: 1px 1px 1px 1px;
              
            color: #4f6b72;  
        } 
        
        .style1
        {
            height: 30px;
            width: 850px;
        }
        .style2
        {
            height: 240px;
            width: 850px;
        }
        
    </style>  
</head>
<body>
    <form id="form1" runat="server">
    <div id="cc">
        <table style=" margin-top:10px">
            <tr><td class="style1">
                <div id="Search" align=left >
                    <label >车次：</label>
                    <input class="easyui-combobox" id="strSCheCi" width="100px" name="车次" data-options="valueField:'ID',textField:'CheID',url:'../ashx/getCheCiUser.ashx?Type=CheCi'">
                    <label >用户：</label>
                    <input class="easyui-combobox" id="strSUser" width="100px" name="用户" data-options="valueField:'ID',textField:'UserName',url:'../ashx/getCheCiUser.ashx?Type=User'">
                    <label >日期：</label>
                    <input class="easyui-datetimebox" id="strDate" data-options="required:true,showSeconds:false" value=" " style="width:120px">
                    <a id="btnSearch" href="#" class="easyui-linkbutton" data-options="toggle:true">查找</a>
                </div>
                </td></tr>
            <tr>
                <td class="style2" align=center valign=top> 
                    <asp:GridView ID="gdvCurrent" runat="server" AutoGenerateColumns="False" Width="100%"
                            CellPadding="4" BorderWidth="0px" GridLines="Vertical" BorderStyle="None" AllowPaging="True"
                            PageSize="8" OnPageIndexChanging="gdvCurrent_PageIndexChanging" >
                            <PagerSettings PageButtonCount="4" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkCheck" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="GvHeader" Width="10px" />
                                    <ItemStyle CssClass="GvItem" Width="10px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID" HeaderText="ID">
                                    <HeaderStyle CssClass="hide" HorizontalAlign="Right" VerticalAlign="Middle"></HeaderStyle>
                                    <ItemStyle CssClass="hide" HorizontalAlign="Right"></ItemStyle>
                                </asp:BoundField>                                                             
                                <asp:BoundField DataField="CheID" HeaderText="车次">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign=Center VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center" ></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ChufaName" HeaderText="出发地">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                                               
                                <asp:BoundField DataField="MudiName" HeaderText="目的地">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center" ></ItemStyle>
                                </asp:BoundField>
                                 <asp:BoundField DataField="PiaoShu" HeaderText="票数">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DingPiaoShu" HeaderText="订票">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="YuPiao" HeaderText="余票">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="PiaoJia" HeaderText="票价">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CheDate" HeaderText="日期">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CheTime" HeaderText="时间">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                                                          
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        用户</HeaderTemplate>
                                    <ItemTemplate>
                                        <a href="javascript:viewUser('<%# DataBinder.Eval(Container.DataItem,"UsersID")%>','<%# DataBinder.Eval(Container.DataItem,"UserID")%>','<%# DataBinder.Eval(Container.DataItem,"UserName")%>','<%# DataBinder.Eval(Container.DataItem,"TypeName")%>','<%# DataBinder.Eval(Container.DataItem,"UserTel")%>','<%# DataBinder.Eval(Container.DataItem,"UserEmail")%>')"><%# DataBinder.Eval(Container.DataItem,"UserName")%></a>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" CssClass="GvHeader" Width="40px" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GvItem" Width="40px" />
                                </asp:TemplateField> 
                                                                                                       
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle HorizontalAlign="Center" BackColor="#d1ecfc" CssClass="PageButton" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle CssClass="GridAlternatingRowStyle" />
                        </asp:GridView>
 
                </td>
            </tr>
            <tr>
                <td valign=top style="width:850px;height:85px">
                    <table id="tabedit">
                        <tr>
                            <td><label >用户ID：</label></td>
                            <td><input id="txtUserID" class="easyui-validatebox" type="text" name="name" ></td>
                            <td><label >用户名：</label></td>
                            <td><input id="txtUserName" class="easyui-validatebox" type="text" name="name" ></td>
                            <td><label >角色：</label></td>
                            <td><input id="txtType" class="easyui-validatebox" type="text" name="name" ></td>
                        </tr>
                        <tr>
                            <td><label >手机：</label></td>
                            <td><input id="txtTell" class="easyui-validatebox" type="text" name="name" ></td>
                            <td><label >邮箱：</label></td>
                            <td><input id="txtEmail" class="easyui-validatebox" type="text" name="name"></td>
                            <td colspan=2><label>有情况联系这里！</label></td>
                        </tr>
                        <tr>
                            
                            <td colspan=6 align=center> 
                                <asp:TextBox ID="ID" runat="server" CssClass="hide"></asp:TextBox> 
                                <label >选中需要删除的项目进行删除：</label>
                                <a id="btnDelete" href="#" class="easyui-linkbutton">删除</a>
                                
                            </td>
                        </tr>
                    </table>
                  
                </td>
            </tr>
        </table>
    </div>
    <asp:TextBox ID="txtPageIndex" runat="server" CssClass="hide"></asp:TextBox>  
    </form>
</body>
</html>

