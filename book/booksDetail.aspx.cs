using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class booksDetail : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
    BorrowService borrowSrv = new BorrowService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Request.QueryString.Count == 0)
        {
            //Response.Redirect("books.aspx");
        }
        else 
        {
            if (!IsPostBack)
            {
                Bind();  //调用自定义方法Bind()
            }
        }
    }
    public void Bind()
    {
        GridView1.DataSource = bookSrv.Getbooks(Request.QueryString["t_id"]);
        GridView1.DataBind();

        GridView2.DataSource = bookSrv.GetbookTJ();
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bookDataContext db = new bookDataContext();
        int p = (from i in db.jiehuanbiao
                 where (i.name == Session["CustomerName"].ToString() && i.j_huan == null)
                 select i).Count();
        int w = (from i in db.jiehuanbiao
                 where (i.name == Session["CustomerName"].ToString() && i.t_id == int.Parse(Request.QueryString["t_id"]) && i.j_huan == null)
                 select i).Count();
        var g = (from i in db.Customer
                 where (i.name == Session["CustomerName"].ToString())
                 select i).First();
        var v = bookSrv.GetbooksByTid(int.Parse(Request.QueryString["t_id"]));
        int y = (from c in db.jiehuanbiao
                 where (c.j_yingh < DateTime.Now && c.j_huan == null && c.name == Session["CustomerName"].ToString())
                 select c).Count();

        if (Session["CustomerId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else if (w > 0)
        {
            Response.Write("<script>alert('您正在借阅本图书，不能重复借阅！');</script>");
        }
        else if (v.s_kucun == 0)
        {
            Response.Write("<script>alert('本图书没有库存！请借阅其他书籍');</script>");
        }
        else if (y > 0)
        {
            Response.Write("<script>alert('您有图书逾期不还，不能在本图书馆借阅图书！');</script>");
        }
        else if (p > 4)
        {
            Response.Write("<script>alert('正在借阅的图书不能超过5本！');</script>");
        }
        else if (g.age < 18 && p > 2)
        {
            Response.Write("<script>alert('您还未成年，正在借阅的图书不能超过3本！');</script>");
        }
        else
        {
            int t_id = int.Parse(Request.QueryString["t_id"]);
            var a = (from i in db.tushubiao where i.t_id == t_id select new { i.s_cishu, i.s_kucun, i.s_yijie }).First();
            int j = a.s_cishu.Value;
            int c = a.s_kucun.Value;
            int k = a.s_yijie.Value;

            borrowSrv.Add(t_id, int.Parse(Session["CustomerId"].ToString()), DateTime.Today, Session["CustomerName"].ToString(), DateTime.Today.AddMonths(+1).AddDays(-1));
            bookSrv.UpdateZT(t_id, c - 1, k + 1, j + 1);

            Response.Redirect("~/Borrowing.aspx");
        }       
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        Bind();
    }
}