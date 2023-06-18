using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using System.Xml.Linq;
using book.DAL;

public partial class admin_Borrowing : System.Web.UI.Page
{
    BorrowService borrowSrv=new BorrowService();
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
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
        bookDataContext db = new bookDataContext();
        if (Request.QueryString["j_id"] == null)
        {
            Dates();
        }
        else
        {
            int j_id = int.Parse(Request.QueryString["j_id"]);
            var b = (from e in db.jiehuanbiao
                     where e.j_id == j_id
                     select e).First();
            var t_id = b.t_id;
            var a = (from i in db.tushubiao where i.t_id == t_id select new { i.s_cishu, i.s_kucun, i.s_yijie }).First();
            int j = a.s_cishu.Value;
            int c = a.s_kucun.Value;
            int k = a.s_yijie.Value;

            borrowSrv.UpdateHS(j_id, DateTime.Today);
            bookSrv.UpdateZT(t_id, c + 1, k - 1, j);

            Dates();
        }
    }
    public void Dates()
    {
        var jh = borrowSrv.GetJHs(10);
        if (jh.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "数据库中无借还记录，请添加！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource =jh;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("BorrowAdd1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Return.aspx");
    }
}