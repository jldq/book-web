<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="books.aspx.cs" Inherits="books" %>

<%@ Register Src="~/UserControl/bookTree.ascx" TagPrefix="uc1" TagName="bookTree" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
          .auto-style1 {
              width: 40%;
              height: 26px;
          }
          .auto-style2 {
              width: 30%;
              height: 26px;
          }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:35px;border-right:1px solid gray;width:100%;">
        <br />
        <a href="Default.aspx">推荐</a>
        <br />
        <br />
        <br />
         <a style="color:#4186D3">图书</a>
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
        <a href="Urge.aspx">催还记录</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div style="float:left;margin-left:4%;width:215px;">
         <uc1:bookTree runat="server" ID="bookTree" />
    </div>
     <div style="float:left;width:75%;margin-left:35px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PagerSettings-Mode="NextPrevious" AutoGenerateColumns="False"
            PageSize="5" Width="80%" OnPageIndexChanging="GridView1_PageIndexChanging">
        <PagerSettings Mode="NextPrevious" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" Position="TopAndBottom" 
            PreviousPageText="上一页"></PagerSettings>
             <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                         <table style="border:1px solid gray;width:100%;">
                             <tr>
                                 
                                 <td rowspan="6" style="border:1px solid gray;width:25%">
                                     <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("s_img") %>' style="width:113px; Height:150px;margin-left:10px"/>
                                 </td>
                                 
                                 <td style="border:1px solid gray;width:25%">
                                     ISBN:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("ISBN") %>' ></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="border:1px solid gray;width:25%">
                                     书名:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("s_shuming") %>' ></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="border-right:1px solid gray;width:25%">
                                     类型:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("l_id") %>' ></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="border:1px solid gray;width:25%">
                                     作者:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("s_zuozhe") %>' ></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="border:1px solid gray;width:25%">
                                     出版社:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("s_chubanshe") %>' ></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="border:1px solid gray;width:25%">
                                     库存数量:
                                 </td>
                                 <td style="border:1px solid gray;width:50%">
                                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("s_kucun") %>' ></asp:Label>
                                 </td>
                             </tr>
                         </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="t_id" DataNavigateUrlFormatString="Borrowing.aspx?t_id={0}" DataTextFormatString="{0:c}" HeaderText="是否借书" Text="借书"  ControlStyle-ForeColor="#3333FF"/>
                <asp:HyperLinkField DataNavigateUrlFields="t_id" DataNavigateUrlFormatString="booksDetail.aspx?t_id={0}" DataTextFormatString="{0:c}" HeaderText="查看详情" Text="查看"  ControlStyle-ForeColor="#3333FF"/>
            </Columns>
        </asp:GridView>
      </div>
</asp:Content>

