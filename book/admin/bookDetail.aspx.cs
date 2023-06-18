using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using book.BLL;

public partial class admin_bookDetail : System.Web.UI.Page
{
    bookService bookSrv=new bookService();
    TypeService TypeSrv = new TypeService();
    LogService LogSrv = new LogService();
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
        if (Request.QueryString["ISBN"]==null)
        {
            Panel1.Visible = false;
            Label1.Text = "数据传输错误，请重新操作";
        }
        else
        {
            string  ISBN =Request.QueryString["ISBN"];
            var books = bookSrv.GetBookISBN(ISBN);

            var types =  TypeSrv.GetTypes();
            foreach (var type in types)
            {
                DropDownList1.Items.Add(new ListItem(type.l_leixing,type.l_id.ToString()));
            }

            TextBox1.Text = books.s_shuming;
            TextBox2.Text = books.ISBN;
            TextBox3.Text = books.s_zuozhe;
            DropDownList1.SelectedValue = books.l_id.ToString();
            TextBox4.Text = books.s_chubanshe;
            TextBox5.Text = books.s_cbriqi.ToString();
            TextBox6.Text = books.s_danjia.ToString();
            TextBox7.Text = books.s_jianjie;
            TextBox9.Text = books.s_kucun.ToString();
            TextBox10.Text=books.s_yijie.ToString();
            TextBox8.Text = books.s_cishu.ToString();
            Image1.ImageUrl = books.s_img + "?temp=" + DateTime.Now.Millisecond.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ISBN = Request.QueryString["ISBN"];
        var books = bookSrv.GetBookISBN(ISBN);

        //if (bookSrv.IsExitSM(TextBox1.Text.Trim()))  //输入的书名已存在
        //{
        //    Label3.Text = "该书名已存在！";
        //}
        //else
        //{
            bookSrv.Update(TextBox2.Text.Trim(),
                         TextBox1.Text.Trim(),
                        int.Parse(DropDownList1.SelectedValue), TextBox3.Text.Trim(), TextBox4.Text.Trim(), DateTime.Parse(TextBox5.Text.Trim()),
                        decimal.Parse(TextBox6.Text.Trim()), int.Parse(TextBox9.Text.Trim()), int.Parse(TextBox10.Text.Trim()),
                        TextBox7.Text.Trim(),int.Parse(TextBox8.Text.Trim()));

            LogSrv.Add(Session["AdminName"].ToString(), "修改", DateTime.Now, "图书表");

            if (FileUpload1.PostedFile.ContentLength!=0)
            {
                string filePath = Server.MapPath("~/") + bookSrv.GetBookISBN(ISBN).s_img.Substring(1);
                File.Delete(filePath);

                FileUpload1.PostedFile.SaveAs(filePath);
            }

            //清除页面缓存
            Response.Buffer = true;
            
            Response.Redirect("Default.aspx");
        //}
    }
}