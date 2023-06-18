<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrowing.aspx.cs" Inherits="admin_Borrowing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
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
    <asp:Button ID="Button1" runat="server" Text="借书" Height="33px" Width="68px" style="margin-left:10%;float:left" OnClick="Button1_Click"/>
    <asp:Button ID="Button2" runat="server" Text="还书" Height="33px" Width="68px"  style="margin-left:3%;float:left" OnClick="Button2_Click"/>
    <%--<a href="BorrowAdd1.aspx" style="margin-left:10%;color:#4186D3">添加借还记录>></a>--%>
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:5%;margin-top:20px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="183px"  Width="90%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="18">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
        <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="j_id" HeaderText="借还编号" />
            <asp:BoundField DataField="t_id" HeaderText="图书编号" />
            <%--<asp:BoundField DataField="c_id" HeaderText="用户编号" />
            <asp:BoundField DataField="k_id" HeaderText="读者编号" />--%>
            <asp:BoundField DataField="j_jiechu" HeaderText="借出日期" />
            <asp:BoundField DataField="j_yingh" HeaderText="应还日期" />
            <asp:BoundField DataField="j_huan" HeaderText="归还日期" />
            <asp:BoundField DataField="name" HeaderText="姓名" />
            <asp:BoundField DataField="j_zhuangtai" HeaderText="状态" />
            <asp:BoundField DataField="j_beizhu" HeaderText="备注" />
            <asp:HyperLinkField HeaderText="修改" Text="修改" DataNavigateUrlFields="j_id" 
                DataNavigateUrlFormatString="BorrowUpdate.aspx?j_id={0}" DataTextFormatString="{0:c}" 
                ControlStyle-ForeColor="#3333FF"/>
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

