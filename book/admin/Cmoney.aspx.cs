using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Cmoney : System.Web.UI.Page
{
    CmoneyService CmoneySrv = new CmoneyService();
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
        var ts = CmoneySrv.GetFJ(10);
        if (ts.Count == 0)
        {
            Panel1.Visible = false;
            Label1.Text = "数据库中无罚金记录，请添加！";
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "";
        }
        GridView1.DataSource = ts;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cmoney1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cmoney2.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cmoney3.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        var ty = CmoneySrv.GetFJByLeixing("一般涂鸦");
        var ds = CmoneySrv.GetFJByLeixing("图书丢失");
        var tl = CmoneySrv.GetFJByLeixing("书标脱落");

        if (DropDownList1.Text == "一般涂鸦")
        {
            GridView1.DataSource = ty;
            GridView1.DataBind();
        }
        else if (DropDownList1.Text == "图书丢失")
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else if (DropDownList1.Text == "书标脱落")
        {
            GridView1.DataSource = tl;
            GridView1.DataBind();
        }
        else if (DropDownList1.Text == "显示全部")
        {
           Bind();
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        //GridView1.BottomPagerRow.Visible = false;//导出到Excel表后，隐藏分页部分

        //GridView1.Columns[10].Visible = false;//隐藏“编辑”列

        //GridView1.AllowPaging = false;//取消分页，便于导出所有数据，不然只能导出当前页面的几条数据

        Bind();


        DateTime dt = DateTime.Now;//给导出后的Excel表命名，结合表的用途以及系统时间来命名
        string filename = dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() + dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString();

        /*如导出的表中有某些列为编号、身份证号之类的纯数字字符串，如不进行处理，则导出的数据会默认为数字，例如原字符串"0010"则会变为数字10，字符串"1245787888"则会变为科学计数法1.236+E9，这样便达不到我们想要的结果，所以需要在导出前对相应列添加格式化的数据类型，以下为格式化为字符串型*/

        foreach (GridViewRow dg in this.GridView1.Rows)
        {
            dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
            dg.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
            dg.Cells[5].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
            dg.Cells[6].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
        }

        Response.Clear();
        Response.AddHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode("读者罚金表" + filename, System.Text.Encoding.UTF8) + ".xls");//导出文件命名
        Response.ContentEncoding = System.Text.Encoding.UTF7;//如果设置为"GB2312"则中文字符可能会乱码
        Response.ContentType = "applicationshlnd.xls";
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        Panel1.RenderControl(oHtmlTextWriter);//Add the Panel into the output Stream.
        Response.Write(oStringWriter.ToString());//Output the stream.
        Response.Flush();
        Response.End();
    }

    //重载VerifyRenderingInServerForm方法，否则运行的时候会出现如下错误提示：“类型“GridView”的控件“GridView1”必须放在具有 runat=server 的窗体标记内”
    public override void VerifyRenderingInServerForm(Control control)
    {
        //override VerifyRenderingInServerForm.
    }
}