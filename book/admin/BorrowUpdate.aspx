<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BorrowUpdate.aspx.cs" Inherits="admin_BorrowUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
    .auto-style3 {
        background-color: aliceblue;
        width: 35%;
    }
    .auto-style4 {
        width: 35%;
    }
    .auto-style7 {
        width: 90px;
        height: 41px;
    }
    .auto-style8 {
        width:90px;
        height: 41px; 
    }
    .auto-style9 {
        background-color: aliceblue;
        width: 65%;
    }
    .auto-style10 {
        width: 65%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin-left:35px;border-right:1px solid gray;width:100%">
        <br />
        <a href="Default.aspx" >图书管理</a>
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
        <a style="color:#4186D3">借还管理</a>
         <br />
        <br />
        <br />
        <a href="Audit.aspx">审核</a>
        <br />
        <br />
        <br />
        <a href="Urge.aspx" >催还管理</a>
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
                       <div style="margin-left:10%;margin-top:20px;width:500px;float:left">
    <asp:Panel ID="Panel1" runat="server">
    <asp:GridView ID="GridView1" runat="server" style="width:500px;"  AutoGenerateColumns="False">
        <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table style="width:100%;height:320px">
                            <tr>
                                <td colspan="2" style="text-align:center;font-size:larger;font-weight:bolder">修改借还记录</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">借还编号:</td>
                                <td  class="auto-style9"><asp:Label ID="Label1" runat="server" Text='<%# Bind("j_id") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">书名:</td>
                                <td class="auto-style10" >
                                    <asp:Label ID="Label2" runat="server"  Text='<%# Bind("s_shuming") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td  class="auto-style3">借阅时间:</td>
                                <td  class="auto-style9">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("j_jiechu") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">读者:</td>
                                <td class="auto-style10">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("name") %>'></asp:Label></td>
                            </tr>
                         </table>
                      </ItemTemplate>
                </asp:TemplateField>
             </Columns>
    </asp:GridView>
                        <table  style="width:500px;height:130px">
                             <tr>
                                <td  class="auto-style3">备注:</td>
                                <td  class="auto-style9">
                                    <asp:TextBox ID="TextBox1" runat="server"  Height="29px" Width="205px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="取消" Height="33px" Width="68px"/></td>
                                <td class="auto-style8">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" BackColor="#4186D3" Text="修改" Height="37px" Width="79px" BorderColor="White" /></td>
                            </tr>
                        </table>                 
  </asp:Panel>
        <asp:Label ID="Label6" runat="server" style="margin-left:5%;margin-top:20px;width:500px;float:left"></asp:Label>
        </div>
</asp:Content>

