using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Return : System.Web.UI.Page
{
    BorrowService borrowSrv = new BorrowService();
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

        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_yingh, j.t_id, j.name, j.j_huan, j.j_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.s_zuozhe, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.j_huan == null
                      orderby a.j_id descending
                      select new
                      {
                          ISBN = b.ISBN,
                          name = a.name,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          s_zuozhe = b.s_zuozhe,
                          j_jiechu = a.j_jiechu.ToString(),
                          j_yingh = a.j_yingh.ToString(),
                          j_id = a.j_id.ToString()
                      }).ToList();


        if (result != null)
        {
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        if (result.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "没有正在借阅的图书！";
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        bookDataContext db = new bookDataContext();

        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_yingh, j.t_id, j.name, j.j_huan, j.j_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.s_zuozhe, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where (a.j_huan == null && a.name==TextBox1.Text.Trim())
                      orderby a.j_id descending
                      select new
                      {
                          ISBN = b.ISBN,
                          name = a.name,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          s_zuozhe = b.s_zuozhe,
                          j_jiechu = a.j_jiechu.ToString(),
                          j_yingh = a.j_yingh.ToString(),
                          j_id = a.j_id.ToString()
                      }).ToList();

        if (result != null)
        {
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        if (result.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "该读者没有正在借阅的图书！";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Bind();
    }
}
