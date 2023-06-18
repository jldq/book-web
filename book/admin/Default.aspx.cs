using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using System.Xml.Linq;
using System.Data;
using System.Web.Security;

public partial class admin_Default : System.Web.UI.Page
{
    bookService bookSrv=new bookService();
    LogService LogSrv = new LogService();
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
        if (ts.Count==0)
        {
           Panel1.Visible= false;
           Label1.Text = "数据库中无图书，请添加！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource= ts;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex= e.NewPageIndex;
        Bind();
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
                        bookSrv.DeleteBook(t_id);
                        LogSrv.Add(Session["AdminName"].ToString(), "删除", DateTime.Now, "图书表");
                    }
                }
            }
        }
        Bind();
    }
}