<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Brules.aspx.cs" Inherits="Brules" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="width: 980px;line-height:30px">
        <p style="font-size:larger;font-weight:bolder">借阅规则：</p>
        <div>1.未成年读者正在借阅的图书不能超过3本。</div>
        <div>2.已成年的读者正在借阅的图书不能超过5本。</div>
        <div>3.图书逾期不还者，该读者在超时且未还书期间不能在本图书馆正常借书。</div>
        <div>4.如图书丢失或存在污损，依图书丢失、污损赔偿规定，请读者自觉到前台缴费。</div>
        <div>5.请各位读者务必保管好本图书馆的图书，做到不丢页、不破页、没有字迹等。</div>
        <div>6.请各位读者记好图书的应还时间，务必在该时间前前往图书馆还书。</div>
        <div style="color:red">注：如有读者需要到前台缴费，请该读者积极配合，否则该读者在未缴费期间不能在本图书馆正常借书。</div>
        <br />
        <br />
        <p style="font-size:larger;font-weight:bolder">图书丢失、污损赔偿规定：</p>
        <div>1.丢失处理：&nbsp  一律按原书价的三倍加2元书本加工费。</div>
        <div>2.污损处理：&nbsp (1)一般涂鸦，不影响阅读，则赔偿10元。</div>
        <div>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp(2)书标或条码脱落找不回，则赔偿5元。</div>
        <div>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp(3)水渍严重、图书变形、涂鸦严重、掉页找不回，这些情况一律按丢失处理。</div>
    </div>
</asp:Content>

