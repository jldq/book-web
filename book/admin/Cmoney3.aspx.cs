using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Cmoney3 : System.Web.UI.Page
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
        CmoneySrv.Add(TextBox2.Text.Trim(), TextBox1.Text.Trim(), 5, "书标脱落", "已缴费");
        Response.Redirect("~/admin/Cmoney.aspx");
    }
}