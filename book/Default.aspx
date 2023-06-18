<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        a{text-decoration:none;color:black}
        a:hover{color:#4186D3}
        .col-sm-3{
            border:1px solid white;
            background-color:ghostwhite;
            text-align:center;
            width:200px;
            height:228px;
            padding:10px;
            float:left;
            margin:5px 8px 5px 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:35px;border-right:1px solid gray;width:100%">
        <br />
        <a style="color:#4186D3">推荐</a>
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
        <a href="Urge.aspx">催还记录</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="margin-left:5%;">
        <div style="float:left">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/10.png" Height="330px" Width="750px" OnClick="ImageButton1_Click"/>
        </div>
        <div style="float:left;margin-left:3%;width:350px;height:300px">
            <p style="line-height:35px;background-color:#185F9F;color:white;font-weight:bolder;padding-left:5px">快速导航</p>
            <div style="float:left;margin-left:15px;margin-bottom:7px">
                <div style="width:110px;background-color:#3B96C1;text-align:center;padding:5px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/js.png" Height="30px" Width="30px"/><br />
                    <span style="line-height:25px;color:white;">图书馆介绍</span>
                </div>
                <div style="width:110px;background-color:#E5781B;text-align:center;margin-top:7px;padding:5px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/xj.png" Height="40px" Width="40px"/><br />
                    <span style="line-height:30px;color:white;padding-left:5px">续借规则</span>
                </div>
            </div>
            <div style="float:right;background-color:#214987;text-align:center;margin-right:15px;padding-top:15px; padding-left: 5px; padding-right: 5px; padding-bottom: 15px;width:180px">
                <a href="Brules.aspx">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/gz.png" Height="90px" Width="90px"/><br />
                <span style="line-height:35px;color:white;padding-left:5px">借阅规则</span></a>
            </div>
            <div style="margin-left:15px;width:220px;background-color:#178C4B;clear:both;padding:7px 0px 7px 100px">              
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/sj.png" Height="45px" Width="45px"/> 
                <div style="color:white;padding-left:15px;float:right;line-height:45px;background-color:#178C4B;margin-right:95px">开馆时间</div>
            </div>
        </div>

        <div style="clear:both;">
            <p style="line-height:35px;font-weight:bolder;padding-left:5px;border-bottom:1px solid gray">到馆新书</p>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
               <ItemTemplate>
                   <div class="col-sm-3">
                    <a href="booksDetail.aspx?t_id=<%# Eval("t_id", "{0}") %>"> 
                    <asp:Image ID="img8" runat="server" Width="145px" Height="193px" ImageUrl='<%# Eval("s_img", "{0}") %>'/></a>
                                                                             
                    <div style="color:black;font-size:13px;padding:5px"> <%#DataBinder.Eval(Container.DataItem,"s_shuming") %></div>                                
                            
                   </div>
                </ItemTemplate>
            </asp:DataList>
          </div>

         <div style="clear:both;">
            <p style="line-height:35px;font-weight:bolder;padding-left:5px;border-bottom:1px solid gray">推荐图书</p>
            <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
               <ItemTemplate>
                   <div class="col-sm-3">
                    <a href="booksDetail.aspx?t_id=<%# Eval("t_id", "{0}") %>"> 
                    <asp:Image ID="img8" runat="server" Width="145px" Height="193px" ImageUrl='<%# Eval("s_img", "{0}") %>'/></a>
                                                                             
                    <div style="color:black;font-size:13px;padding:5px"> <%#DataBinder.Eval(Container.DataItem,"s_shuming") %></div>                                
                            
                   </div>
                </ItemTemplate>
            </asp:DataList>
          </div>
    </div>
</asp:Content>


