using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class books : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
           
        }
        else
        {
            Bind();  //调用自定义方法Bind()
        }
    }
    public void Bind()
    {
        GridView1.DataSource = bookSrv.GetbookByTidOrLid(Request.QueryString["t_id"], Request.QueryString["l_id"]);
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("booksDetail.aspx?t_id=");
    //}
}