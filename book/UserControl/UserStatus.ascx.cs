using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_UserStatus : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] != null || Session["CustomerId"] != null)  //用户已登录
        {
            if (Session["AdminId"] != null)  //管理员用户
            {
                Label1.Text = "您好，" + Session["AdminName"];
                LinkButton3.Visible = false;
                LinkButton2.Visible = true;
                LinkButton1.Visible = false;
            }
            else if (Session["CustomerId"] != null)  //一般用户
            {
                Label1.Text = "您好，" + Session["CustomerName"];
                LinkButton3.Visible = false;
                LinkButton1.Visible = true;
                LinkButton2.Visible = false;
            }
            LinkButton4.Visible = true;
        }
        else
        {
            LinkButton2.Visible = false;
            LinkButton1.Visible = false;
            LinkButton4.Visible = false;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ChangePwd.aspx");
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Log.aspx");
    }
}