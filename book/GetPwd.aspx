<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="GetPwd.aspx.cs" Inherits="GetPwd" %>


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
    <div style="border:1px solid black;padding:10px;height: 290px; width: 360px;background-color:white;border-radius:20px;margin:5%;margin-left:15%">

     <table style="border-collapse: collapse; height: 271px; width: 345px;">
        <tr>
          <td style="text-align:center;font-size:larger;font-weight:bolder" colspan="2">找回密码</td>
        </tr>
        <tr>
          <td style="text-align:right">用户名:</td>
          <td style="text-align:right">
            <asp:TextBox ID="txtName" runat="server" Height="25px" Width="220px"></asp:TextBox></td>
          <td>
            <asp:RequiredFieldValidator ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ID="rfvName" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td style="text-align:right">邮箱:</td>
          <td style="text-align:right">
            <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="220px"></asp:TextBox></td>
          <td>
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ID="rfvEmail" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td style="text-align:right" colspan="2">
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
              ErrorMessage="邮箱格式不正确！" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td style="text-align:right" colspan="2">
            <asp:Button ID="btnResetPwd" runat="server" Text="找回密码" OnClick="btnResetPwd_Click" Height="40px" Width="110px"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">找回密码，需要验证邮箱！</td>
        </tr>
        <tr>
          <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
      </table>
</div>
    </form>
 </div>
</body>
</html>


