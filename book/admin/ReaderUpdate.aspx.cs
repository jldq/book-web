using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ReaderUpdate : System.Web.UI.Page
{
    ReaderService readerSrv = new ReaderService();
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
        if (Request.QueryString["k_id"] == null)
        {
            Panel1.Visible = false;
            Label1.Text = "数据传输错误，请重新操作";
        }
        else
        {
            int k_id = int.Parse(Request.QueryString["k_id"]);
            var reader = readerSrv.GetReaderByKid(k_id);

            TextBox1.Text = reader.k_xingming;
            TextBox2.Text = reader.k_Email;
            TextBox3.Text = reader.k_age.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Reader.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int k_id =int.Parse(Request.QueryString["k_id"]);

        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            readerSrv.Update(k_id, TextBox1.Text.Trim(), TextBox2.Text.Trim(),int.Parse(TextBox3.Text.Trim()));
            Response.Redirect("~/admin/Reader.aspx");
        }
    }
}