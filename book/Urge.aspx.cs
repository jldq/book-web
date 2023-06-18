using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Urge : System.Web.UI.Page
{
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

        var result = (from a in db.cuihuanbiao.Select(j => new { j.c_neirong, j.c_riqi, j.t_id, j.c_name, j.c_id }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where a.c_name == Session["CustomerName"].ToString()
                      orderby a.c_id descending
                      select new
                      {
                          ISBN = b.ISBN,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          c_neirong = a.c_neirong.ToString(),
                          c_riqi = a.c_riqi.ToString(),
                          c_id = a.c_id.ToString()
                      }).ToList();

        if (result.Count > 0)
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        else
        {
            Panel1.Visible = false;
            Label1.Text = "您没有本图书管的催还记录！请继续保持";
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