using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BRecord : System.Web.UI.Page
{
    BorrowService borrowSrv = new BorrowService();
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerId"] == null)
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
            Datas();
        }
        else
        {
            int j_id = int.Parse(Request.QueryString["j_id"]);
            var b = (from e in db.jiehuanbiao
                     where e.j_id == j_id
                     select e).First();
            var t_id =b.t_id; 
            var a = (from i in db.tushubiao where i.t_id == t_id select new { i.s_cishu, i.s_kucun, i.s_yijie }).First();
            int j = a.s_cishu.Value;
            int c = a.s_kucun.Value;
            int k = a.s_yijie.Value;

            borrowSrv.UpdateHS(j_id, DateTime.Today);
            bookSrv.UpdateZT(t_id, c + 1, k - 1, j);

            Datas();
        }
    }
    public void Datas()
    {
        bookDataContext db = new bookDataContext();

        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_huan, j.t_id, j.name, j.j_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.s_zuozhe, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.name == Session["CustomerName"].ToString()
                      orderby a.j_id descending
                      select new
                      {
                          ISBN = b.ISBN,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          s_zuozhe = b.s_zuozhe,
                          j_jiechu = a.j_jiechu.ToString(),
                          j_huan = a.j_huan.ToString(),
                          j_id=a.j_id.ToString()
                      }).ToList();

        if (result.Count>0)
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        else
        {
            Panel1.Visible = false;
            Label1.Text = "您没有本图书管的借还记录！";
        }
        GridView1.DataSource = result;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
}