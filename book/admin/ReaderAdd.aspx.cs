using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ReaderAdd : System.Web.UI.Page
{
    ReaderService readerSrv = new ReaderService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Reader.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text!="" && TextBox2.Text != "")
        {
            readerSrv.Add(TextBox1.Text.Trim(), TextBox2.Text.Trim(), int.Parse(TextBox3.Text.Trim()));
            Response.Redirect("~/admin/Reader.aspx");
        }
    }
}