using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class admin_BorrowAdd2 : System.Web.UI.Page
{
    ReaderService readerSrv = new ReaderService();
    BorrowService borrowSrv = new BorrowService();
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
        var kh = readerSrv.GetReader(10);
        if (kh.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "数据库中无读者信息，请添加！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource = kh;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int y = 0;
        int k_id = 0;
        string name;
        GridView GridView1 = new GridView();
        GridView1 = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("GridView1");
        if (GridView1 != null)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox xz = new CheckBox();
                xz = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (xz != null)
                {
                    if (xz.Checked)
                    {
                        bookDataContext db = new bookDataContext();
                        int t_id = int.Parse(Request.QueryString["t_id"]);
                        var a = (from p in db.tushubiao where p.t_id == t_id select new { p.s_cishu, p.s_kucun, p.s_yijie }).First();
                        int j = a.s_cishu.Value;
                        int c = a.s_kucun.Value;
                        int k = a.s_yijie.Value;

                        k_id = int.Parse(GridView1.Rows[i].Cells[1].Text.Trim());
                        name = GridView1.Rows[i].Cells[2].Text.Trim();

                        y = (from u in db.jiehuanbiao
                                 where (u.j_yingh < DateTime.Now && u.j_huan == null && u.name == name)
                                 select c).Count();
                        int q = (from p in db.jiehuanbiao
                                 where (p.name == name && p.j_huan == null)
                                 select p).Count();
                        var g = (from p in db.kehubiao
                                 where p.k_xingming == name
                                 select p).First();
                        int l = (from p in db.jiehuanbiao
                                 where (p.name == name && p.t_id == t_id && p.j_huan == null)
                                 select p).Count();

                        if (k_id>0)
                        {
                            if (l > 0)
                            {
                                Response.Write("<script>alert('您正在借阅本图书，不能重复借阅！');</script>");
                                Bind();
                            }
                            else if (y > 0)
                            {
                                Response.Write("<script>alert('您有图书逾期不还，不能在本图书馆借阅图书！');</script>");
                                Bind();
                            }
                            else if (q > 4)
                            {
                                Response.Write("<script>alert('正在借阅的图书不能超过5本！');</script>");
                                Bind();
                            }
                            else if (g.k_age < 18 && q > 2)
                            {
                                Response.Write("<script>alert('您还未成年，正在借阅的图书不能超过3本！');</script>");
                                Bind();
                            }
                            else
                            {
                                borrowSrv.AAdd(int.Parse(Request.QueryString["t_id"]), k_id, DateTime.Today, name, DateTime.Today.AddMonths(+1).AddDays(-1));
                                bookSrv.UpdateZT(t_id, c - 1, k + 1, j + 1);
                                Response.Redirect("Borrowing.aspx");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('请选择读者');</script>");
                            Bind();
                        }
                    }
                }
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        var reader = readerSrv.GetReaderBySearchText(TextBox1.Text.Trim());
        GridView1.DataSource = reader;
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Bind();
    }
}