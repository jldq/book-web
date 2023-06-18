using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Application : System.Web.UI.Page
{
    BorrowService borrowSrv = new BorrowService();
    public static string jid;
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
        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_yingh, j.t_id, j.name, j.j_id, j.j_huan}).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.j_id == int.Parse(Request.QueryString["j_id"])
                      select new
                      {
                          jid=a.j_id.ToString(),
                          ISBN = b.ISBN,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          name = a.name,
                          j_jiechu = a.j_jiechu.ToString(),
                          j_yingh = a.j_yingh.ToString()
                      }).ToList();


        GridView1.DataSource = result;
        GridView1.DataBind();

        jid = result.First().jid;

        var jzt = from t in db.jiehuanbiao
                  where t.j_id == int.Parse(jid)
                  select t.j_zhuangtai;

        if (jzt.First() == "未审核")
        {
            Panel1.Visible = false;
            Label6.Text = "您已成功提交续借申请！请耐心等待图书馆管理员审核...";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {     
        borrowSrv.SubmitXJ(int.Parse(jid),"未审核");

        Panel1.Visible = false;
        Label6.Text = "您已成功提交续借申请！请耐心等待图书馆管理员审核...";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Borrowing.aspx");
    }
}