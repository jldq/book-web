<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="booksDetail.aspx.cs" Inherits="booksDetail" %>

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
    <div style="margin-left:35px;border-right:1px solid gray;width:100%">
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
    <asp:GridView ID="GridView1" runat="server" style="margin-left:3%;width:76%;float:left;margin-top:0;" AutoGenerateColumns="False">
        <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="margin-left:3%;line-height:30px;margin-top:20px">
                        <div>
                             <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("s_img") %>' style="width:213px; Height:283px;float:left"/>
                             <div style="float:left;margin-left:20px;margin-top:15px">
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("s_shuming") %>' style="font-size:x-large;font-weight:bold"></asp:Label><br />
                                 <span>作者：</span><asp:Label ID="Label2" runat="server" Text='<%# Bind("s_zuozhe") %>'></asp:Label><br />
                                 <span>本月借出次数：</span><asp:Label ID="Label3" runat="server" Text='<%# Bind("s_cishu") %>'></asp:Label><br />
                                 <span>库存数量：</span><asp:Label ID="Label7" runat="server"  Text='<%# Bind("s_kucun") %>'></asp:Label>
                                 <div style="margin-top:100px;margin-left:200px">
                                     <asp:Button ID="Button1" runat="server" Text="借书" OnClick="Button1_Click"  Height="40px" Width="90px"/>
                                 </div>
                             </div>
                        </div>
                       
                        <div style="clear:both;width:800px;padding-top:30px">
                            <p style="font-size:larger;font-weight:bolder">图书介绍</p>
                            <div>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("s_jianjie") %>'></asp:Label>
                            </div>
                        </div>

                        <div style="padding-top:30px">
                            <p style="font-size:larger;font-weight:bolder">出版信息</p>
                            <div>ISBN：<asp:Label ID="Label5" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label></div>
                            <div>书名：<asp:Label ID="Label6" runat="server" Text='<%# Bind("s_shuming") %>'></asp:Label></div>
                            <div>图书类型：<asp:Label ID="Label8" runat="server"  Text='<%# Bind("l_id") %>'></asp:Label></div>
                            <div>出版社：<asp:Label ID="Label9" runat="server"  Text='<%# Bind("s_chubanshe") %>'></asp:Label></div>
                            <div>出版日期：<asp:Label ID="Label10" runat="server"  Text='<%# Bind("s_cbriqi") %>'></asp:Label></div>
                            <div>单价：<asp:Label ID="Label11" runat="server" Text='<%# Bind("s_danjia") %>'></asp:Label></div>
                        </div>
                      </div>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" style="width:20%;float:left;margin-top:0" PageSize="4"  AllowPaging="True"
        PagesSettings-Mode="NextPrevious" OnPageIndexChanging="GridView2_PageIndexChanging">
         <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
         <Columns>
               <asp:TemplateField HeaderText="大家都在看">
                    <ItemTemplate>
                        <div style="width:100%;line-height:25px;padding:15px">
                           <asp:Image ID="Image2" runat="server"  ImageUrl='<%# Bind("s_img") %>' style="width:113px; Height:150px;"/><br />
                           <asp:Label ID="Label12" runat="server" Text='<%# Bind("s_shuming") %>'></asp:Label><br />
                           <asp:Label ID="Label13" runat="server" Text='<%# Bind("s_zuozhe") %>'></asp:Label><span style="color:gray">(作者）</span>
                        </div>
                    </ItemTemplate>
               </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="t_id" DataNavigateUrlFormatString="booksDetail.aspx?t_id={0}" DataTextFormatString="{0:c}" HeaderText="查看详情" Text="查看"  ControlStyle-ForeColor="#3333FF"/>
        </Columns>
    </asp:GridView>
</asp:Content>

