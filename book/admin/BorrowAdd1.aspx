<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BorrowAdd1.aspx.cs" Inherits="admin_BorrowAdd1" %>

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
    <div style="margin-left:12%;margin-top:10px;">
        <asp:TextBox ID="TextBox1" runat="server" Height="30px"  Width="218px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="查询" Height="30px" Width="68px" OnClick="Button2_Click" BackColor="#4186D3"/>
        <div style="float:right;margin-right:550px">
            <asp:Button ID="Button3" runat="server" Text="显示全部" Height="30px" Width="68px" OnClick="Button3_Click"/>
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server" Width="90%" style="margin-left:5%;margin-top:20px">
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
            <asp:BoundField DataField="t_id" HeaderText="图书编号" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
            <asp:HyperLinkField DataTextField="s_shuming" HeaderText="书名" DataNavigateUrlFields="ISBN" DataNavigateUrlFormatString="bookDetail.aspx?ISBN={0}" DataTextFormatString="{0:c}" />
            <asp:BoundField DataField="s_zuozhe" HeaderText="作者" />
            <asp:BoundField DataField="l_id" HeaderText="类型" />
            <asp:BoundField DataField="s_chubanshe" HeaderText="出版社" />
            <asp:BoundField DataField="s_kucun" HeaderText="库存数量" />
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Text="" style="margin-left:5%"></asp:Label>

    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="确定" Height="40px" Width="93px" style="margin-left:10%;" OnClick="Button1_Click"  BackColor="#4186D3"/>
</asp:Content>

