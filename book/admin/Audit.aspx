<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Audit.aspx.cs" Inherits="admin_Audit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
        .two{text-align:right;padding-left:80px}
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
        <a style="color:#4186D3">审核</a>
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
    <div style="margin-top:20px">
    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:5%;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="90%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="12">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
        <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="j_id" HeaderText="编号" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
            <asp:BoundField DataField="s_shuming" HeaderText="书名" />
            <asp:BoundField DataField="j_jiechu" HeaderText="借出时间" />
            <asp:BoundField DataField="j_yingh" HeaderText="应还时间" />
            <asp:BoundField HeaderText="续借时间" DataField="j_xj"/>
            <asp:BoundField DataField="name" HeaderText="申请人" />
            <asp:BoundField DataField="j_zhuangtai" HeaderText="审核状态"/>
                 </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="通过" Height="40px" Width="93px" style="margin-left:10%;float:left" OnClick="Button1_Click"/>
    <asp:Button ID="Button2" runat="server" Text="打回" Height="40px" Width="93px"  style="margin-left:10%;float:left" OnClick="Button2_Click"/>
    </asp:Panel>

    <asp:Label ID="Label1" runat="server" style="margin:15%;font-size:larger;"></asp:Label>
    </div>
</asp:Content>

