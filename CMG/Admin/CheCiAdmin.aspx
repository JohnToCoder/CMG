<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheCiAdmin.aspx.cs" Inherits="CMG.Admin.CheCiAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车次管理</title>

    <link href="../JS/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../JS/themes/icon.css" rel="stylesheet" type="text/css" />  
    <script src="../JS/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../JS/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../JS/validator.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).resize(function () {
            var width = $(window).width() - 10;
            var height = $(window).height() - 10;
            $('#cc').width(width);
            $('#cc').height(height);
            $('#cc').layout();   //窗口改变大小时加载  
        });
        $('#btnSearch').bind('click', function () {
            var strChufa = $('#strChufa').combobox('getValue').toString();
            var strMudi = $('#strMudi').combobox('getValue').toString();
            var strDateTime = $('#strDate').datetimebox('getValue').toString();
            var strDate = strDateTime.split(' ')[0].toString();
            var strYear = strDate.split('/')[2].toString() + '/' + strDate.split('/')[0].toString() + '/' + strDate.split('/')[1].toString();
            var strTime = strDateTime.split(' ')[1].toString();

            if (strChufa == "" || strMudi == "") {
                $.messager.alert('输入错误', '请选择出发地/目的地！', 'info');
            } else {
                var iFrameContent = $("#Iframe1").contents();
                iFrameContent.find("#listview").empty();
                var searchlist = "";
                $.post('ashx/getCheci.ashx', { 'init': '1', 'chufa': strChufa, 'mudi': strMudi, 'date': strYear, 'time': strTime }, function (data) {
                    searchlist = data;
                    iFrameContent.find("#chcilist").append(searchlist);
                })
            }
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
            width: 859px;
        }
        .style2
        {
            height: 300px;
            width: 859px;
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
                    <input class="easyui-combobox" id="strChufa" name="出发地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'">
                    <label >目的地：</label>
                    <input class="easyui-combobox" id="strMudi" name="目的地" data-options="valueField:'staID',textField:'staName',url:'../ashx/getStation.ashx'">
                    <label >日期：</label>
                    <input class="easyui-datetimebox" id="strDate" data-options="required:true,showSeconds:false" value=" " style="width:120px">
                    <a id="btnSearch" href="#" class="easyui-linkbutton" data-options="toggle:true">查找</a>
                </div>
                </td></tr>
            <tr>
                <td class="style2">                            
                    <asp:GridView ID="gvcheci" runat="server" AutoGenerateColumns="False" 
                        Height="255px" Width="743px" AllowPaging="True" AllowSorting="True" 
                        DataSourceID="SqlDataSourceCheCi">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID">
                                <ItemStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CheID" HeaderText="车次" SortExpression="CheID" >
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ChufaID" HeaderText="出发地" SortExpression="ChufaID" >
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MudiID" HeaderText="目的地" SortExpression="MudiID" >
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CheDate" HeaderText="日期" SortExpression="CheDate" >
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CheTime" HeaderText="时间" SortExpression="CheTime" >
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PiaoShu" HeaderText="票数" SortExpression="PiaoShu" >
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:CommandField ShowEditButton="True"/>
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCheCi" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CMGConnectionString %>" 
                        SelectCommand="SELECT [ID], [CheID], [ChufaID], [MudiID], [CheDate], [CheTime], [PiaoShu] FROM [tabCheCi]"
                        DeleteCommand="delete from dbo.tabCheCi where ID=@ID"
                        UpdateCommand = "Update tabCheCi set CheID =@CheID, ChufaID=@ChufaID,MudiID=@MudiID,CheDate = @CheDate,CheTime=@CheTime,PiaoShu=@PiaoShu where ID=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type=String />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CheID" Type=String />
                            <asp:Parameter Name="ChufaID" Type=String />
                            <asp:Parameter Name="MudiID" Type=String />
                            <asp:Parameter Name="CheDate" Type=String />
                            <asp:Parameter name="CheTime" Type=String />
                            <asp:Parameter Name="PiaoShu" Type=String />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
