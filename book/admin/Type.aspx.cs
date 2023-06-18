using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using book.DAL;
using System.Data;
using System.Web.UI.WebControls;

public partial class admin_Type : System.Web.UI.Page
{
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        var bookCount = bookSrv.GetBookByLid(int.Parse(DetailsView1.DataKey.Value.ToString()));
        if (bookCount != 0)
        {
            Label1.Text = "Error: 该类型下有图书，要删除该类型请先删除图书！";
            e.Cancel = true;
        }
    }
}