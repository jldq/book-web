using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
            //Response.Redirect("books.aspx");
        }
        else
        {
            Bind();  //调用自定义方法Bind()
        }
    }
    public void Bind()
    {
        if (Request.QueryString["SearchText"]!="")
        {
            string strSearchText= Request.QueryString["SearchText"].ToString();
            GridView1.DataSource=bookSrv.GetBookBySearchText(strSearchText);
            GridView1.DataBind();
        }
        else
        {
            Label7.Text = "无搜索结果！";
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
}