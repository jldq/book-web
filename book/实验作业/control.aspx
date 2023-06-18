<%@ Page Language="C#" AutoEventWireup="true" CodeFile="control.aspx.cs" Inherits="实验作业_control" %>

<%@ Register Src="~/实验作业/Control/BTree.ascx" TagPrefix="uc1" TagName="BTree" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:BTree runat="server" ID="BTree" />
        </div>
    </form>
</body>
</html>
