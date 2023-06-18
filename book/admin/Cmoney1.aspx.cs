using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Cmoney1 : System.Web.UI.Page
{
    CmoneyService CmoneySrv = new CmoneyService();
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null && TextBox2 != null)
        {
            Response.Redirect("~/admin/Cmoney11.aspx?name=" +TextBox1.Text.Trim()+"&shuming="+TextBox2.Text.Trim());
        }
        else
        {
            Response.Write("<script>alert('请填写相关信息');</script>");
        }
    }
}