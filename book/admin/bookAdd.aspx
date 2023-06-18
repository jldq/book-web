<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bookAdd.aspx.cs" Inherits="admin_bookAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
        .two{text-align:right;padding-left:80px}
        .auto-style1 {
             height: 471px;
             width: 933px;
            margin-right: 10px;
        }
        .auto-style2 {
            width: 314px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:35px;border-right:1px solid gray;width:100%">
        <br />
        <a style="color:#4186D3">图书管理</a>
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
        <a href="Cmoney.aspx">收取罚金</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="margin-left:10%">
        <asp:Panel ID="Panel1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="4" style="font-weight:bolder;font-size:larger;text-align:center">添加图书</td>
            </tr>
            <tr>
                <td >ISBN:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox2" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="two">单价：</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>书名：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="two">库存数量：</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox9" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                   <td>图书类型：</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="28px"  Width="213px"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空" ControlToValidate="DropDownList1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>   
                <td class="two">简介：</td>
                <td rowspan="2">
                    <asp:TextBox ID="TextBox7" runat="server" Height="83px" TextMode="MultiLine" Width="262px" style="margin-top: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>作者：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox3" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
             <tr>
                <td>出版社：</td>
                 <td class="auto-style2">
                     <asp:TextBox ID="TextBox4" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                 </td>
                 <td class="two">图片：</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>出版日期：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox5" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox5" Format="yyyy-MM-dd"/>
                </td>
            </tr>
             <tr>
                <td class="auto-style3">借出次数：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox8" runat="server" Height="28px"  Width="213px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Button ID="Button1" runat="server" Text="添加图书" OnClick="Button1_Click" Height="44px" Width="113px" />
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
</asp:Content>
