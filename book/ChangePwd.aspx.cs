using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;

public partial class ChangePwd : System.Web.UI.Page
{
    CustomerService customerSrv = new CustomerService();
    private HashAlgorithm provider;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerId"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string password = TextBox1.Text;
        provider = new MD5CryptoServiceProvider();

        byte[] data = Encoding.Default.GetBytes(password);
        byte[] hashedPassword = provider.ComputeHash(data);


        string mm = System.BitConverter.ToString(hashedPassword);//将加密后的字节数组转化为字符串

        if (Page.IsValid)
        {
            //调用CustomerService类中的CheckLogin()方法检查Session变量CustomerName关联的用户名和输入的原密码，返回值大于0表示输入的原密码正确
            if (customerSrv.CheckLogin(Session["CustomerName"].ToString(), mm) > 0)
            {
                string pwd = TextBox2.Text;
                provider = new MD5CryptoServiceProvider();

                byte[] datas = Encoding.Default.GetBytes(pwd);
                byte[] hashedPwd = provider.ComputeHash(datas);


                string xmm = System.BitConverter.ToString(hashedPwd);//将加密后的字节数组转化为字符串

                customerSrv.ChangePassword(Convert.ToInt32(Session["CustomerId"]), xmm);
                Label1.Text = "密码修改成功！";
            }
            else  //输入的原密码不正确
            {
                Label1.Text = "原密码不正确！";
            }
        }
    }
}
