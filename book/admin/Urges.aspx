<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Urges.aspx.cs" Inherits="admin_Urges" %>

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
        <a  href="Reader.aspx">读者管理</a>
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
        <a style="color:#4186D3">催还管理</a>
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
    <asp:Panel ID="Panel1" runat="server" Width="95%" style="margin-left:7%;margin-top:20px;line-height:35px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="92%" AllowPaging="True"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
        <Columns>
            <asp:BoundField DataField="c_id" HeaderText="催还编号" />
            <asp:BoundField DataField="t_id" HeaderText="图书编号" />
            <asp:BoundField DataField="k_id" HeaderText="读者编号" />
            <asp:BoundField DataField="c_name" HeaderText="姓名" />
            <asp:BoundField DataField="c_riqi" HeaderText="催还日期" />
            <asp:BoundField DataField="c_neirong" HeaderText="内容" />
            <asp:BoundField DataField="c_beizhu" HeaderText="备注" />
            <asp:HyperLinkField ControlStyle-ForeColor="#3333FF" DataNavigateUrlFields="c_id" DataNavigateUrlFormatString="UrgeUpdate.aspx?c_id={0}" DataTextFormatString="{0:c}" HeaderText="修改" Text="修改">
            <ControlStyle ForeColor="#3333FF" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

