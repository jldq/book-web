using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using book.BLL;

public partial class _Default : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    public void Bind()
    {
        var books = bookSrv.GetXS(10);
        DataList1.DataSource =books;
        DataList1.DataBind();


        var book = bookSrv.GetTJS(10);
        DataList2.DataSource = book;
        DataList2.DataBind();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        var k = bookSrv.GetbooksByTid(1014);
        Response.Redirect("~/booksDetail.aspx?t_id=" + k.t_id);
    }
}