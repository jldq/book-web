using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BorrowAdd1 : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
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
        var ts = bookSrv.GetTS(10);
        if (ts.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "数据库中无图书，请添加！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource = ts;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int t_id = 0;
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
                        t_id = int.Parse(GridView1.Rows[i].Cells[1].Text.Trim()); 
                    }
                }
            }
        }
        if (t_id > 0)
        {
            var w = bookSrv.GetbooksByTid(t_id);
            if (w.s_kucun == 0)
            {
                Response.Write("<script>alert('本图书没有库存！请借阅其他书籍');</script>");
                Bind();
            }
            else
            {
                Response.Redirect("BorrowAdd2.aspx?t_id=" + t_id);
            }
        }
        else
        {
            Response.Write("<script>alert('请选择借阅图书');</script>");
            Bind();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        var book = bookSrv.GetBookBySearchText(TextBox1.Text.Trim());
        GridView1.DataSource = book;
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Bind();
    }
}