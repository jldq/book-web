using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Cmoney11 : System.Web.UI.Page
{
    CmoneyService CmoneySrv = new CmoneyService();
    bookService bookSrv = new bookService();
    LogService LogSrv = new LogService();
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Bind();
        }
    }
    public void Bind()
    {
        if (Request.QueryString["shuming"] == null || Request.QueryString["name"] == null)
        {
            Panel1.Visible = false;
            Label2.Text = "数据传输错误，请重新操作";
        }
        else
        {
            bookDataContext db = new bookDataContext();
            var book = (from b in db.tushubiao
                        where b.s_shuming == Request.QueryString["shuming"]
                        select b).First();

            decimal jg = book.s_danjia.Value;
            decimal fj = jg * 3 + 2;

            Label1.Text = fj.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bookDataContext db = new bookDataContext();
        var book = (from b in db.tushubiao
                    where b.s_shuming == Request.QueryString["shuming"]
                    select b).First();

        decimal jg = book.s_danjia.Value;
        int kucun = book.s_kucun.Value - 1;

        LogSrv.Add(Session["AdminName"].ToString(), "图书丢失", DateTime.Now, "图书表");
        bookSrv.UpdateKC(Request.QueryString["shuming"], kucun);
        CmoneySrv.Add1(Request.QueryString["shuming"], Request.QueryString["name"], decimal.Parse(Label1.Text), "图书丢失", jg, DropDownList1.Text);
        Response.Redirect("~/admin/Cmoney.aspx");
    }
}