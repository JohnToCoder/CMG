<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Note.aspx.cs" Inherits="CMG.Note" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
    <link href="themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="JS/jquery-1.8.3.js" type="text/javascript"></script>	
    <script src="ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.accordion.js" type="text/javascript"></script>
    <link href="themes/demos.css" rel="stylesheet" type="text/css" />
	
</head>
<body>    
    <div id="cc">
	</div>
    <script type="text/javascript">
        $(function () {
            $.post('ashx/getNote.ashx', function (data) {
                notelist = data;
                $("#cc").append(notelist);
            })            
        });
	</script>
    
</body>
</html>
