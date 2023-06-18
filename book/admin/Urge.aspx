<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Urge.aspx.cs" Inherits="admin_Urge" %>

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
     <a  href="Urges.aspx" style="margin-left:7%;color:blue">查看催还记录>></a>
     <br />

    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:7%;margin-top:20px;line-height:35px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="933px" AllowPaging="True" PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="18">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
            <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="j_id" HeaderText="借还编号" />
                <asp:BoundField DataField="t_id" HeaderText="图书编号" />
                <asp:BoundField DataField="name" HeaderText="读者" />
                <asp:BoundField DataField="j_yingh" HeaderText="应还时间" />
            </Columns>
        </asp:GridView>
         <br />
         <br />
    <asp:Button ID="Button1" runat="server" Text="催还" Height="40px" Width="93px"  OnClick="Button1_Click"/>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

