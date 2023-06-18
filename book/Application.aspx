<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Application.aspx.cs" Inherits="Application" %>

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
        <a href="Default.aspx">推荐</a>
        <br />
        <br />
        <br />
        <a href="books.aspx">图书</a>
        <br />
        <br />
        <br />
        <a style="color:#4186D3">正在借阅</a>
        <br />
        <br />
        <br />
        <a href="BRecord.aspx">借还记录</a>
        <br />
        <br />
        <br />
        <a href="Urge.aspx">催还记录</a>
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
                        <table style="width:100%;height:460px">
                            <tr>
                                <td colspan="2" style="text-align:center;font-size:larger;font-weight:bolder">续借申请</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">ISBN:</td>
                                <td  class="auto-style9"><asp:Label ID="Label1" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label></td>
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
                                <td class="auto-style4">应还时间:</td>
                                <td class="auto-style10"  >
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("j_yingh") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td  class="auto-style3">续借:</td>
                                <td  class="auto-style9">1个月</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">申请人:</td>
                                <td class="auto-style10">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("name") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="取消" Height="33px" Width="68px"/></td>
                                <td class="auto-style8">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" BackColor="#4186D3" Text="申请" Height="37px" Width="79px" BorderColor="White" /></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
  </asp:Panel>
        <asp:Label ID="Label6" runat="server" style="margin-left:5%;margin-top:20px;width:500px;float:left"></asp:Label>
        </div>
    <div style="color:red;width:350px;float:left;margin-left:110px;line-height:30px">
        <p style="font-size:larger;font-weight:bolder">温馨提示：</p>
        <div>1.本图书馆续借申请一次只能续借1个月。</div>
        <div>2.单本书只能续借3次，否则管理员审核不通过。</div>
        <div>3.请各位读者务必保管好本图书馆的图书，做到不丢页、不破页、没有字迹等。</div>
        <div>4.请各位读者记好图书的应还时间，务必在该时间前前往图书馆还书。</div>
    </div>
</asp:Content>

