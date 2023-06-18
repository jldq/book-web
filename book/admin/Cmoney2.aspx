<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cmoney2.aspx.cs" Inherits="admin_Cmoney2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
        .two{text-align:right;padding-left:80px}
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
            padding-top:30px;
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
        <a  href="Reader.aspx" >读者管理</a>
        <br />
        <br />
        <br />
        <a href="Borrowing.aspx" >借还管理</a>
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
        <a style="color:#4186D3">收取罚金</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <table style="margin-left:20%;" class="auto-style21">
                            <tr>
                                <td colspan="2" style="text-align:center;font-size:larger;font-weight:bolder" class="auto-style14">一般涂鸦</td>
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
                                <td class="auto-style17">书名:</td>
                                <td class="auto-style19">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="29px" Width="205px"></asp:TextBox>
                                </td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style12">金额:</td>
                                <td class="auto-style18">
                                    10元
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">状态:</td>
                                <td class="auto-style19">
                                    <asp:DropDownList ID="DropDownList1" runat="server"  Height="29px" Width="205px">
                                        <asp:ListItem Value="未缴费"></asp:ListItem>
                                        <asp:ListItem Value="已缴费"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="DropDownList1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style20">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" BackColor="#4186D3" Text="确认" Height="37px" Width="79px" BorderColor="White" /></td>
                            </tr>
                        </table>
</asp:Content>

