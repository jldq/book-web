using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Audit : System.Web.UI.Page
{
    BorrowService borrowSrv=new BorrowService();
    ReaderService readerSrv = new ReaderService();
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        bookDataContext db = new bookDataContext();
        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Bind();
        }
        var o = (from i in db.jiehuanbiao
                         where (i.j_zhuangtai == "未审核" && i.j_huan != null)
                         select i).Count();
        if (o >0)
        {
            jiehuanbiao oo = (from i in db.jiehuanbiao
                             where (i.j_zhuangtai == "未审核" && i.j_huan != null)
                             select i).First();
            borrowSrv.SubmitXJGiveup(oo.j_id);
        }
    }
    public void Bind()
    {
        bookDataContext db = new bookDataContext();
  
        var result = (from a in db.jiehuanbiao.Select(j => new { j.j_jiechu, j.j_yingh, j.t_id, j.name, j.j_id, j.j_zhuangtai, j.j_huan }).ToList()
                      join b in db.tushubiao.Select(t => new { t.ISBN, t.s_shuming, t.t_id }).ToList()
                      on a.t_id equals b.t_id
                      where (a.j_zhuangtai == "未审核" && a.j_huan==null) 
                      select new
                      {
                          j_id = a.j_id.ToString(),
                          ISBN = b.ISBN,
                          t_id = b.t_id.ToString(),
                          s_shuming = b.s_shuming,
                          name = a.name,
                          j_xj = "1个月",
                          j_jiechu = a.j_jiechu.ToString(),
                          j_yingh = a.j_yingh.ToString(),
                          j_zhuangtai=a.j_zhuangtai
                      }).ToList();


        if (result.Count>0)
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        else
        {
            Panel1.Visible = false;
            Label1.Text = "暂无读者的续借申请！";
        }
        GridView1.DataSource = result;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int j_id = 0;
        GridView GridView1 = new GridView();
        GridView1 = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("GridView1");
        if (GridView1 != null)
        {
            for (int i= 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox xz = new CheckBox();
                xz = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (xz != null)
                {
                    if (xz.Checked)
                    {
                        j_id = int.Parse(GridView1.Rows[i].Cells[1].Text.Trim());
                        bookDataContext db = new bookDataContext();
                        var yhtime = from t in db.jiehuanbiao
                                     where t.j_id==j_id
                                     select t.j_yingh;

                        DateTime T = yhtime.First().Value;

                        borrowSrv.SubmitXJGet(j_id, "已审核", T.AddMonths(+1));

                        Bind();
                    }
                }
            }
        }

        Bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
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
                        var result = borrowSrv.GetJHByJid(j_id);

                        var reader = readerSrv.GetReaderByName(result.name);

                        var book = bookSrv.GetbooksByTid(result.t_id);

                        string nr = "读者您好，您现在借阅的图书" + book.s_shuming + "的续借申请已超过3次，现打回您的申请，请记好图书的应还时间" + result.j_yingh + "，请务必在该时间前前往图书馆还书";
                        //新建自定义的EmailSender类实例emailSender对象
                        EmailSender emailSender = new EmailSender(reader.k_Email, nr);
                        //调用自定义的EmailSender类中的Send()方法发送邮件
                        emailSender.SendNot();

                        borrowSrv.SubmitXJNot(j_id);

                        Bind();
                    }
                }
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
}