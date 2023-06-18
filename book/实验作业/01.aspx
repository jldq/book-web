<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="实验作业_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 526px;
        }
        .auto-style2 {
            height: 44px;
        }
        .auto-style3 {
            width: 326px;
            height: 44px;
        }
        .auto-style4 {
            width: 618px;
            height: 269px;
            margin-right: 11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="border-collapse: collapse;" class="auto-style4">
                <tr>
                    <td>用户名：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入用户名！" 
                            ControlToValidate="TextBox1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>密码：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入密码！" 
                            ControlToValidate="TextBox2" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>确认密码：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码与确认密码不一致！"
                            ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                 <tr>
                    <td>生日：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="日期应在1900-1-1到2020-1-1之间！"
                            ControlToValidate="TextBox4" Display="Dynamic" MaximumValue="2020-1-1" MinimumValue="1900-1-1">
                        </asp:RangeValidator>
                    </td>
                </tr>
                 <tr>
                    <td>电话号码：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入电话号码！" 
                            ControlToValidate="TextBox5" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style2">身份证号：</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入身份证号！"
                            ControlToValidate="TextBox6" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="确定" Height="34px" Width="78px" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" 
                            DisplayMode="List" Height="45px" Display="None" Width="613px"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
