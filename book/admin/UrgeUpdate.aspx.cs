using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_UrgeUpdate : System.Web.UI.Page
{
    UrgeService urgeSrv = new UrgeService();
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
        var result = (from a in db.cuihuanbiao.Select(j => new { j.c_riqi, j.t_id, j.c_name, j.c_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.s_shuming, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.c_id == int.Parse(Request.QueryString["c_id"])
                      select new
                      {
                          c_id = a.c_id.ToString(),
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          c_name = a.c_name,
                          c_riqi = a.c_riqi.ToString(),
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
        Response.Redirect("Urges.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        urgeSrv.SubmitBeiZhu(int.Parse(Request.QueryString["c_id"]), TextBox1.Text.Trim());
        Response.Redirect("Urges.aspx");
    }
}