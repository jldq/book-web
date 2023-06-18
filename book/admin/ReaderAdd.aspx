<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReaderAdd.aspx.cs" Inherits="admin_ReaderAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
        .auto-style7 {
            width: 90px;
            height: 41px;
        }
        .auto-style12 {
            height: 44px;
            width: 90px;
        }
        .auto-style14 {
            height: 33px;
        }
        .auto-style17 {
            width: 90px;
            height: 27px;
        }
        .auto-style18 {
            height: 44px;
            width: 50px;
        }
        .auto-style19 {
            width: 50px;
            height: 27px;
        }
        .auto-style20 {
            width: 50px;
            height: 41px;
        }
        .auto-style21 {
            width: 39%;
            height: 330px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin-left:35px;border-right:1px solid gray;width:100%">
        <br />
        <a href="Default.aspx">图书管理</a>
        <br />
        <br />
        <br />
        <a  href="Type.aspx">类型管理</a>
        <br />
        <br />
        <br />
        <a  style="color:#4186D3">读者管理</a>
        <br />
        <br />
        <br />
        <a href="Borrowing.aspx">借还管理</a>
         <br />
        <br />
        <br />
        <a href="Audit.aspx">审核</a>
        <br />
        <br />
        <br />
        <a href="Urge.aspx">催还管理</a>
        <br />
        <br />
        <br />
         <a href="Cmoney.aspx">收取罚金</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
                          <table style="margin-left:20%;" class="auto-style21">
                            <tr>
                                <td colspan="2" style="text-align:center;font-size:larger;font-weight:bolder" class="auto-style14">添加读者</td>
                            </tr>
                            <tr>
                                <td class="auto-style12">姓名:</td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="29px" Width="205px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">邮箱:</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="29px" Width="205px"></asp:TextBox>
                                </td>
                                <td><asp:RegularExpressionValidator ID="revEmail" runat="server"  ErrorMessage="邮箱格式不正确！" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style12">年龄:</td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="TextBox3" runat="server" Height="29px" Width="205px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="取消" Height="33px" Width="68px"/></td>
                                <td class="auto-style20">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" BackColor="#4186D3" Text="添加" Height="37px" Width="79px" BorderColor="White" /></td>
                            </tr>
                        </table>
</asp:Content>

