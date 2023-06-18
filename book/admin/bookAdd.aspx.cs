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

public partial class admin_bookAdd : System.Web.UI.Page
{
    private string uploadDir;
    bookService bookSrv = new bookService();
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
            if (bookSrv.IsExitBS())
            {
                Panel1.Visible = false;
                Label1.Text = "请先添加类型！";
            }
            else
            {
                Panel1.Visible=true;
                Label1.Text = "";
                Bind();
                uploadDir = Path.Combine(Request.PhysicalApplicationPath, "Images");
            }
        }
    }
    /// <summary>
    /// 自定义方法Bind()用于填充“类型”下拉列表的值
    /// </summary>
    public void Bind()
    {
        var types = TypeSrv.GetTypes();
        foreach (var type in types)
        {
            DropDownList1.Items.Add(new ListItem(type.l_leixing, type.l_id.ToString()));
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (bookSrv.IsExitISBN(TextBox2.Text.Trim()))  //输入的ISBN已存在
        {
            Label2.Text = "该图书已存在！";
        }
        else
        {
            string fileName;
            string fileFolder;
            string dateTime = "";
            fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            dateTime += DateTime.Now.Year.ToString();
            dateTime += DateTime.Now.Month.ToString();
            dateTime += DateTime.Now.Day.ToString();
            dateTime += DateTime.Now.Hour.ToString();
            dateTime += DateTime.Now.Minute.ToString();
            dateTime += DateTime.Now.Second.ToString();
            fileName = dateTime + fileName;
            fileFolder = Server.MapPath("~/") + "tsimg\\" ;
            fileFolder = fileFolder + fileName;
            FileUpload1.PostedFile.SaveAs(fileFolder);

            if (FileUpload1.PostedFile.FileName=="")
            {
                Label3.Text = "无图片上传！";
            }
            else
            {
                if (FileUpload1.PostedFile.ContentLength>2048000)
                {
                    Label3.Text = "文件大小不能超过2M";
                }
                else
                {
                    string extension=Path.GetExtension(FileUpload1.PostedFile.FileName);
                    switch (extension.ToLower())
                    {
                        case ".bmp":
                        case ".jpg":
                        case ".png":
                        case ".gif":
                            break;
                        default:
                            Label3.Text = "文件扩展名必须是bmp、gif、jpg、png！";
                            return;

                    }
                    //string fileName1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fullPath=Path.Combine(fileFolder, fileName);
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(fullPath);
                        Label3.Text = "文件" + fileName + "成功上传到" + fullPath;
                    }
                    catch (Exception ee)
                    {
                        Label3.Text = ee.Message;
                    }
                    bookSrv.Add("~\\tsimg\\" + fileName, TextBox2.Text.Trim(),
                          TextBox1.Text.Trim(),
                         int.Parse(DropDownList1.SelectedValue), TextBox3.Text.Trim(), TextBox4.Text.Trim(), DateTime.Parse(TextBox5.Text.Trim()),
                         decimal.Parse(TextBox6.Text.Trim()), int.Parse(TextBox9.Text.Trim()),
                         TextBox7.Text.Trim(),int.Parse(TextBox8.Text.Trim()));

                    LogSrv.Add(Session["AdminName"].ToString(),"添加",DateTime.Now,"图书表");

                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}