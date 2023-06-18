using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BorrowUpdate : System.Web.UI.Page
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
        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.t_id, j.name, j.j_id}).ToList()
                      join b in db.tushubiao.Select(t => new { t.s_shuming, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.j_id == int.Parse(Request.QueryString["j_id"])
                      select new
                      {
                          j_id = a.j_id.ToString(),
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          name = a.name,
                          j_jiechu = a.j_jiechu.ToString(),
                      }).ToList();


        if (result != null)
        {
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        if (result.Count == 0)
        {
            Panel1.Visible = false;
            Label6.Text = "数据传输错误，请重新操作";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Borrowing.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        borrowSrv.SubmitBeiZhu(int.Parse(Request.QueryString["j_id"]),TextBox1.Text.Trim());
        Response.Redirect("Borrowing.aspx");
    }
}