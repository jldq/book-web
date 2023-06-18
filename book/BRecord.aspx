<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BRecord.aspx.cs" Inherits="BRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
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
        <a href="Borrowing.aspx">正在借阅</a>
        <br />
        <br />
        <br />
        <a style="color:#4186D3">借还记录</a>
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
    <asp:Panel ID="Panel1" runat="server">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="90%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="23">
          <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField HeaderText="编号" DataField="j_id"/>
              <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
              <asp:HyperLinkField DataTextField="s_shuming" HeaderText="书名"  DataNavigateUrlFields="t_id" DataNavigateUrlFormatString="booksDetail.aspx?t_id={0}" DataTextFormatString="{0:c}"/>
              <asp:BoundField DataField="s_zuozhe" HeaderText="作者" />
              <asp:BoundField DataField="j_jiechu" HeaderText="借阅日期" />
              <asp:BoundField DataField="j_huan" HeaderText="归还日期" />
          </Columns>
          <RowStyle BackColor="#EFF3FB" />
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
      </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Font-Size="Larger" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

