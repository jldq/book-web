using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using System.Xml.Linq;
using System.Reflection.Emit;
using System.Web.Services.Description;

public partial class admin_Reader : System.Web.UI.Page
{
    ReaderService readerSrv=new ReaderService();
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


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
}