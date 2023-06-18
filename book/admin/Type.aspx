<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Type.aspx.cs" Inherits="admin_Type" %>

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
        <a  style="color:#4186D3">类型管理</a>
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
    <asp:DetailsView ID="DetailsView1"  runat="server" Height="31px" Width="640px" style="margin-left:10%;margin-top:5%;line-height:35px" OnItemDeleting="DetailsView1_ItemDeleting" AllowPaging="True" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DataKeyNames="l_id">
        <Fields>
            <asp:BoundField DataField="l_id" HeaderText="编号" SortExpression="l_id" />
            <asp:BoundField DataField="l_leixing" HeaderText="类型名称" SortExpression="l_leixing" />
            <asp:BoundField DataField="l_qixian" HeaderText="借阅期限" SortExpression="l_qixian" />
            <asp:BoundField DataField="l_miaoshu" HeaderText="类型描述" SortExpression="l_miaoshu" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView> 
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Add" SelectMethod="GetTypes" TypeName="book.BLL.TypeService" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="l_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="l_id" Type="Int32" />
            <asp:Parameter Name="l_leixing" Type="String" />
            <asp:Parameter Name="l_qixian" Type="Int32" />
            <asp:Parameter Name="l_miaoshu" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="l_id" Type="Int32" />
            <asp:Parameter Name="l_leixing" Type="String" />
            <asp:Parameter Name="l_qixian" Type="Int32" />
            <asp:Parameter Name="l_miaoshu" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Red" style="margin-left:10%"></asp:Label>
</asp:Content>

