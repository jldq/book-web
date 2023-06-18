using book.BLL;
using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class admin_Urges : System.Web.UI.Page
{
    UrgeService urgeSrv = new UrgeService();
    BorrowService borrowSrv = new BorrowService();
    ReaderService readerSrv = new ReaderService();
    bookService bookSrv = new bookService();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["AdminId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        //if (Request.QueryString["j_id"] != null)
        //{
            //var result = borrowSrv.GetJHByJid(int.Parse(Request.QueryString["j_id"]));

            //var reader = readerSrv.GetReaderByName(result.name);

            //int j = (from i in db.cuihuanbiao
            //         where (i.t_id == result.t_id && i.k_id == reader.k_id && i.c_riqi==DateTime.Now && i.c_beizhu==null)
            //         select i).Count();
           
            //if (j > 0)
            //{
            //    Response.Write("<script>alert('您今日已催还该读者，不能重复催还！');</script>");
            //    Datas();
            //    //Request.QueryString["j_id"] = null;
            //}
            //else
            //{
        //        if (!IsPostBack)
        //        {
        //            Bind();
        //        }
        //    }
        //}
        //else
        //{
            if (!IsPostBack)
            {
                Bind();
            }
        //}
    }
    public void Bind()
    {
        var urges = urgeSrv.GetCH(10);
        if (urges.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "数据库中无催还记录，请添加！";
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
}