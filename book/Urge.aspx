<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Urge.aspx.cs" Inherits="Urge" %>

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
        <a href="BRecord.aspx">借还记录</a>
        <br />
        <br />
        <br />
        <a style="color:#4186D3">催还记录</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <asp:Panel ID="Panel1" runat="server">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="92%" AllowPaging="True"  style="margin-left:5%;margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">
          <Columns>
              <asp:BoundField HeaderText="编号" DataField="c_id"/>
              <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
              <asp:HyperLinkField DataTextField="s_shuming" HeaderText="书名"  DataNavigateUrlFields="t_id" DataNavigateUrlFormatString="booksDetail.aspx?t_id={0}" DataTextFormatString="{0:c}"/>
              <asp:BoundField DataField="c_riqi" HeaderText="催还日期" />
              <asp:BoundField DataField="c_neirong" HeaderText="发送内容"/>
          </Columns>
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
      </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Font-Size="Larger" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

