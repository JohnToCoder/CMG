<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheCiAdmin.aspx.cs" Inherits="CMG.Admin.CheCiAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车次管理</title>

    <link href="../JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../JS/themes/icon.css" rel="stylesheet" type="text/css" />    
    <link href="../JS/themes/index.css" rel="stylesheet" type="text/css" />      
    <link href="../JS/GvStyle.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.10.2.min.js" type="text/javascript"></script>  
    <script src="../JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../JS/validator.js" type="text/javascript"></script>
    <script src="../JS/CheCiAdmin.js" type="text/javascript"></script>
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
                    <label >出发地：</label>
                    <input class="easyui-combobox" id="strChufa" width="100px" name="出发地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'">
                    <label >目的地：</label>
                    <input class="easyui-combobox" id="strMudi" width="100px" name="目的地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'">
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
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign=Center VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center" ></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ChufaName" HeaderText="出发地">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                                               
                                <asp:BoundField DataField="MudiName" HeaderText="目的地">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center" ></ItemStyle>
                                </asp:BoundField>
                                 <asp:BoundField DataField="PiaoShu" HeaderText="票数">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="PiaoJia" HeaderText="票价">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CheDate" HeaderText="日期">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CheTime" HeaderText="时间">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                                                          
                                
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        修改</HeaderTemplate>
                                    <ItemTemplate>
                                        <a href="javascript:editCheCi('<%# DataBinder.Eval(Container.DataItem,"ID")%>','<%# DataBinder.Eval(Container.DataItem,"CheID")%>','<%# DataBinder.Eval(Container.DataItem,"ChufaID")%>','<%# DataBinder.Eval(Container.DataItem,"MudiID")%>','<%# DataBinder.Eval(Container.DataItem,"PiaoShu")%>','<%# DataBinder.Eval(Container.DataItem,"PiaoJia")%>','<%# DataBinder.Eval(Container.DataItem,"CheDate")%>','<%# DataBinder.Eval(Container.DataItem,"CheTime")%>')">修改</a>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" CssClass="GvHeader" Width="40px" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="GvItem" Width="40px" />
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
                            <td><label >车次：</label></td>
                            <td><input id="txtCheCi" class="easyui-validatebox" type="text" name="name" ></td>
                            <td><label >出发地：</label></td>
                            <td><input class="easyui-combobox" id="txteditChufa"  name="出发地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'"></td>
                            <td><label >目的地：</label></td>
                            <td><input class="easyui-combobox" id="txteditMudi"  name="出发地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'"></td>
                        </tr>
                        <tr>
                            <td><label >票数：</label></td>
                            <td><input id="txtPiaoShu" class="easyui-validatebox" type="text" name="name" ></td>
                            <td><label >日期：</label></td>
                            <td><input id="txtDate" class="easyui-datebox"  name="name"></td>
                            <td><label >时间：</label></td>
                            <td><input id="txtTime" class="easyui-timespinner"  name="name"></td>
                        </tr>
                        <tr>
                            <td><label >票价：</label></td>
                            <td><input id="txtPiaoJia" class="easyui-validatebox" type="text" name="name" validType="number"></td>
                            <td colspan=4 align=center> 
                                <asp:TextBox ID="ID" runat="server" CssClass="hide"></asp:TextBox> 
                                <a id="btnEdit" href="#" class="easyui-linkbutton">修改</a>
                                <a id="btnAdd" href="#" class="easyui-linkbutton">新增</a>
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
