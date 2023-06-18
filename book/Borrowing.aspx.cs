using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using book.DAL;

public partial class Borrowing : System.Web.UI.Page
{
    BorrowService borrowSrv = new BorrowService();
    bookService bookSrv=new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        bookDataContext db = new bookDataContext();
        if (Session["CustomerId"]==null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Request.QueryString["t_id"] != null)
        {
            int q = (from i in db.jiehuanbiao
                     where (i.name == Session["CustomerName"].ToString() && i.j_huan == null)
                     select i).Count();
            var g = (from i in db.Customer
                     where (i.name == Session["CustomerName"].ToString())
                     select i).First();
            int j = (from i in db.jiehuanbiao
                     where (i.name == Session["CustomerName"].ToString() && i.t_id == int.Parse(Request.QueryString["t_id"]) && i.j_huan == null)
                     select i).Count();
            var a = bookSrv.GetbooksByTid(int.Parse(Request.QueryString["t_id"]));
            int y = (from c in db.jiehuanbiao
                    where (c.j_yingh < DateTime.Now && c.j_huan == null && c.name == Session["CustomerName"].ToString())
                    select c).Count();
            
            if (j > 0)
            {
                Response.Write("<script>alert('您正在借阅本图书，不能重复借阅！');</script>");
                Datas();
            }
            else if (a.s_kucun == 0)
            {
                Response.Write("<script>alert('本图书没有库存！请借阅其他书籍');</script>");
                Datas();
            }
            else if ( y > 0)
            {
                Response.Write("<script>alert('您有图书逾期不还，不能在本图书馆借阅图书！');</script>");
                Datas();
            }
            else if (q > 4)
            {
                Response.Write("<script>alert('正在借阅的图书不能超过5本！');</script>");
                Datas();
            }
            else if (g.age < 18 && q > 2)
            {
                Response.Write("<script>alert('您还未成年，正在借阅的图书不能超过3本！');</script>");
                Datas();
            }
            else
            {
                if (!IsPostBack)
                {
                    Bind();
                }
            }
        }
        else 
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }
    }
    public void Bind()
    {
        bookDataContext db = new bookDataContext();
        if (Request.QueryString["t_id"] == null)
        {
            Datas();
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

                Datas();
        }
    }
    public void Datas()
    {
        bookDataContext db = new bookDataContext();
  
        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_yingh, j.t_id, j.name, j.j_huan, j.j_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.s_zuozhe, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where (a.name==Session["CustomerName"].ToString() && a.j_huan==null)
                      orderby a.j_id descending
                      //from t1 in temp1.DefaultIfEmpty()
                      //join c in db.jiehuanbiao(t => new { t.depId, t.name }).ToList() on **t1.FK_DepId * * equals **c.depId.ToString() * * into temp2
                      //from t2 in temp2.DefaultIfEmpty()
                      select new
                      {
                          ISBN = b.ISBN,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          s_zuozhe = b.s_zuozhe,
                          j_jiechu = a.j_jiechu.ToString(),
                          j_yingh = a.j_yingh.ToString(),
                          j_id = a.j_id.ToString()
                      }).ToList();


        if (result!=null)
        {
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        if (result.Count==0)
        {
            Panel1.Visible = false;
            Label1.Text = "您没有正在借阅的图书！";
        }
    }
}