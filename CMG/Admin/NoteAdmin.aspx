<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoteAdmin.aspx.cs" Inherits="CMG.Admin.NoteAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>通知管理</title>

    <link href="../JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../JS/themes/icon.css" rel="stylesheet" type="text/css" />    
    <link href="../JS/themes/index.css" rel="stylesheet" type="text/css" />      
    <link href="../JS/GvStyle.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.10.2.min.js" type="text/javascript"></script>  
    <script src="../JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../JS/NoteAdmin.js" type="text/javascript"></script>
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
            width: 149px;
        }
        #tabedit
        {
            width: 663px;
        }
        #txtTitle
        {
            width: 500px;
        }
        #txtNote
        {
            width: 500px;
            height: 75px;
        }

        #txtDate
        {
            width: 200px;
        }

    </style>  
</head>
<body>
    <form id="form1" runat="server">
    <div id="cc">
        <table style=" margin-top:10px">            
            <tr>
                <td style="width:850px; height:200px"  align=center valign=top> 
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
                                <asp:BoundField DataField="Title" HeaderText="标题">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign=center VerticalAlign="Middle" Width="120px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="left" ></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Note" HeaderText="内容">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="center" VerticalAlign="Middle" Width="240px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="left"></ItemStyle>
                                </asp:BoundField> 
                                <asp:BoundField DataField="CreatDate" HeaderText="时间">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Creator" HeaderText="创建人">
                                    <HeaderStyle CssClass="GvHeader" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="GvItem" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                                              
                               
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        修改</HeaderTemplate>
                                    <ItemTemplate>
                                        <a href="javascript:editNote('<%# DataBinder.Eval(Container.DataItem,"ID")%>','<%# DataBinder.Eval(Container.DataItem,"Title")%>','<%# DataBinder.Eval(Container.DataItem,"Note")%>','<%# DataBinder.Eval(Container.DataItem,"CreatDate")%>','<%# DataBinder.Eval(Container.DataItem,"Creator")%>')">编辑</a>
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
                            <td class="style1"><label >标题：</label></td>
                            <td><input id="txtTitle" class="easyui-validatebox" type="text" name="name" ></td>
                        </tr>
                        <tr>                            
                            <td class="style1" ><label >内容：</label></td>
                            <td>
                            <input id="txtNote" class="easyui-validatebox" type="text" name="name" ></td>                            
                        </tr>
                        <tr>                            
                            <td class="style1" ><label >时间：</label></td>
                            <td>
                            <input id="txtDate" class="easyui-datetimebox" data-options="required:true" value=" " name="name" ></td>                            
                        </tr>
                        <tr>                           
                            <td colspan=2 align=center> 
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
