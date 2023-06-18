<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
      <div  style="width:100%; height:100%;background:url(Images/bj.jpg);position:absolute;background-size:100% 100%;">
      <form id="form1" runat="server">
      <a  href="Default.aspx">
          <image src="Images/fh.png" style="width:50px;margin:20px"></image>
      </a>
    <div style="border:1px solid black;padding:10px;height:320px; width: 360px;background-color:white;border-radius:20px;margin:5%;margin-left:15%">
    
    <table style="border-collapse:collapse; height: 307px; width: 346px;">
        <tr>
            <td  style="text-align:center;font-size:larger;font-weight:bolder" colspan="2">修改密码 </td>
        </tr>
        <tr>
            <td  style="text-align:right" >原密码:</td>
            <td  style="text-align:right" >
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="220px"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td  style="text-align:right">新密码:</td>
            <td  style="text-align:right">
                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="220px"></asp:TextBox>
            </td>
            <td  colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td  style="text-align:right">确定密码:</td>
            <td  style="text-align:right">
                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="220px"></asp:TextBox>
            </td>
            <td  colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2"  style="text-align:right">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次新密码不一致" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td  style="text-align:right"  colspan="2">
                <asp:Button ID="Button1" runat="server" Text="确定修改" OnClick="Button1_Click" Height="40px" Width="110px"/>
            </td>
        </tr>
        <tr>
            <td style="text-align:right" colspan="2">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    </form>
 </div>
</body>
</html>

