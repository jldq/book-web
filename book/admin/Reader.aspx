<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reader.aspx.cs" Inherits="admin_Reader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
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
    <a href="ReaderAdd.aspx" style="margin-left:10%;color:blue">添加读者>></a>
    <br />

    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:5%;margin-top:20px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="183px"  Width="55%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="12">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
        <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="k_id" HeaderText="读者编号" />
            <asp:BoundField DataField="k_xingming" HeaderText="姓名" />
            <asp:BoundField DataField="k_Email" HeaderText="邮箱" />
            <asp:BoundField DataField="k_age" HeaderText="年龄" />
            <asp:HyperLinkField HeaderText="修改" Text="修改" DataNavigateUrlFields="k_id" 
                DataNavigateUrlFormatString="ReaderUpdate.aspx?k_id={0}" DataTextFormatString="{0:c}" 
                ControlStyle-ForeColor="#3333FF"/>
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

