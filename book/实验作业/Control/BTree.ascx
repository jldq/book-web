<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BTree.ascx.cs" Inherits="实验作业_Control_BTree" %>

<div style="float:left;line-height:30px">
  <asp:TreeView ID="TreeView1" runat="server" LineImagesFolder="~/TreeLineImages">
    <Nodes>
        <asp:TreeNode SelectAction="None" Value="类型图书" Text="类型图书"></asp:TreeNode>
    </Nodes> 
  </asp:TreeView>
</div>
<div style="float:left;line-height:30px;color:black">
  <asp:TreeView ID="TreeView2" runat="server">
    <Nodes>
        <asp:TreeNode SelectAction="None" Value="图书数量" Text="图书数量"></asp:TreeNode>
    </Nodes>
  </asp:TreeView>
</div>
