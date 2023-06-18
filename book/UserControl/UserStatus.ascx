<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserStatus.ascx.cs" Inherits="UserControl_UserStatus" %>

<asp:Label ID="Label1" runat="server" Text=""  style="margin-right:10px"></asp:Label>
<asp:LinkButton ID="LinkButton3" runat="server" style="text-decoration:none;border:1px solid white;background-color:#4186D3;padding:5px;border-radius:20px;color:white;padding-left:20px;padding-right:20px" OnClick="LinkButton3_Click">登录</asp:LinkButton>
<asp:LinkButton ID="LinkButton1" runat="server" style="text-decoration:none;color:black;padding-left:10px;padding-right:10px;border-left:1px solid black;" OnClick="LinkButton1_Click">密码修改</asp:LinkButton>
<asp:LinkButton ID="LinkButton2" runat="server" style="text-decoration:none;color:black;padding-left:10px;padding-right:10px;border-left:1px solid black;" OnClick="LinkButton2_Click">查看日志</asp:LinkButton>
<asp:LinkButton ID="LinkButton4" runat="server" style="text-decoration:none;color:black;padding-left:10px;padding-right:10px;border-left:1px solid black;" OnClick="LinkButton4_Click">退出登录</asp:LinkButton>