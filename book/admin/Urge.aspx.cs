using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using System.Xml.Linq;
using System.Reflection.Emit;
using book.DAL;

public partial class admin_Urge : System.Web.UI.Page
{
    BorrowService borrowSrv = new BorrowService();
    ReaderService readerSrv = new ReaderService();
    bookService bookSrv = new bookService();
    UrgeService urgeSrv = new UrgeService();
    bookDataContext db = new bookDataContext();
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
        var urges = borrowSrv.GetCHing(DateTime.Now);
        if (urges.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "暂无读者需催还提醒！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource = urges;
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int j_id = 0;
        GridView GridView1 = new GridView();
        GridView1 = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("GridView1");
        if (GridView1 != null)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox xz = new CheckBox();
                xz = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (xz != null)
                {
                    if (xz.Checked)
                    {
                        j_id = int.Parse(GridView1.Rows[i].Cells[1].Text.Trim());
                        bookDataContext db = new bookDataContext();

                        var result = borrowSrv.GetJHByJid(j_id);

                        var reader = readerSrv.GetReaderByName(result.name);

                        var book = bookSrv.GetbooksByTid(result.t_id);

                        string nr = "读者您好，您现在借阅的图书" + book.s_shuming + "已过了归还时间" + result.j_yingh + "，请尽快前往本图书馆办理还书手续，如需续借，请及时登录本系统申请续借";

                        int j = (from o in db.cuihuanbiao
                                 where (o.t_id == result.t_id && o.k_id == reader.k_id && o.c_riqi == DateTime.Now && o.c_beizhu == null)
                                 select i).Count();

                        if (j > 0)
                        {
                            Response.Write("<script>alert('您今日已催还该读者，不能重复催还！');</script>");
                        }
                        else
                        {
                            //新建自定义的EmailSender类实例emailSender对象
                            EmailSender emailSender = new EmailSender(reader.k_Email, nr);
                            //调用自定义的EmailSender类中的Send()方法发送邮件
                            emailSender.Sends();

                            urgeSrv.add(result.name, result.t_id, reader.k_id, nr);
                        }
                    }
                }
            }

            Bind();
        }
    }
}