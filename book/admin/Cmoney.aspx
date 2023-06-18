<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cmoney.aspx.cs" Inherits="admin_Cmoney" %>

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
    <asp:Button ID="Button1" runat="server" Text="图书丢失" Height="33px" Width="68px" style="margin-left:10%;float:left" OnClick="Button1_Click"/>
    <asp:Button ID="Button2" runat="server" Text="一般涂鸦" Height="33px" Width="68px"  style="margin-left:3%;float:left" OnClick="Button2_Click"/>
    <asp:Button ID="Button3" runat="server" Text="书标脱落" Height="33px" Width="68px"  style="margin-left:3%;float:left" OnClick="Button3_Click"/>
    <div style="margin-right:25%;float:right;"> <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="108px">
        <asp:ListItem Value="显示全部"></asp:ListItem>
        <asp:ListItem Value="一般涂鸦"></asp:ListItem>
        <asp:ListItem Value="书标脱落"></asp:ListItem>
        <asp:ListItem Value="图书丢失"></asp:ListItem>
        </asp:DropDownList>&nbsp &nbsp<asp:Button ID="Button4" runat="server" Text="查询" Height="28px" Width="48px" OnClick="Button4_Click" BackColor="#4186D3"/>
        &nbsp &nbsp &nbsp &nbsp 
        <asp:Button ID="Button5" runat="server" Text="导出Excel" Height="35px" Width="90px" BackColor="#4186D3"  ForeColor="White" OnClick="Button5_Click"/>
    </div>
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:5%;margin-top:20px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="90%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="18">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
        <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="m_id" HeaderText="编号" />
            <asp:BoundField DataField="m_leixing" HeaderText="罚金类型" />
            <asp:BoundField DataField="s_shuming" HeaderText="书名" />
            <asp:BoundField DataField="s_danjia" HeaderText="图书单价" />
            <asp:BoundField DataField="name" HeaderText="读者" />
            <asp:BoundField DataField="moneys" HeaderText="金额" />
            <asp:BoundField DataField="m_time" HeaderText="缴费日期" />
            <asp:BoundField DataField="m_zhuangtai" HeaderText="状态" /> 
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

