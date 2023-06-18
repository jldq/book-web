<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Log.aspx.cs" Inherits="Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="90%" AllowPaging="True"  style="margin-top:20px;line-height:35px"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="23">
          <FooterStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#4186D3" Font-Bold="True" ForeColor="White" />
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField HeaderText="编号" DataField="log_id"/>
              <asp:BoundField DataField="username" HeaderText="身份" /> 
              <asp:BoundField DataField="type" HeaderText="操作类型" />
              <asp:BoundField DataField="action_date" HeaderText="操作日期"/>
              <asp:BoundField DataField="action_table" HeaderText="操作表" />
          </Columns>
          <RowStyle BackColor="#EFF3FB" />
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
      </asp:GridView>
    </asp:Panel>
    <asp:Label ID="Label1" runat="server" Font-Size="Larger" style="margin:15%;font-size:larger;"></asp:Label>
</asp:Content>

