using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Cmoney2 : System.Web.UI.Page
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
        CmoneySrv.Add(TextBox2.Text.Trim(), TextBox1.Text.Trim(), 10,"一般涂鸦","已缴费");
        Response.Redirect("~/admin/Cmoney.aspx");
    }
}