using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using book.BLL;
using System.Xml.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Web.Services.Description;


public partial class NewUser : System.Web.UI.Page
{
    ReaderService readerSrv = new ReaderService();
    private HashAlgorithm provider;

    protected void Button1_Click(object sender, EventArgs e)
    {
        CustomerService customerSrv = new CustomerService();

        if (Page.IsValid)
        {
            if (customerSrv.IsNameExist(TextBox1.Text.Trim()))
            {
                Label1.Text = "用户名已存在！";
            }
            else
            {
                string password = TextBox3.Text;
                provider = new MD5CryptoServiceProvider();

                byte[] data = Encoding.Default.GetBytes(password);
                byte[] hashedPassword = provider.ComputeHash(data);


                string mm = System.BitConverter.ToString(hashedPassword);//将加密后的字节数组转化为字符串


                customerSrv.Insert(TextBox1.Text.Trim(), mm, TextBox2.Text.Trim(),int.Parse(TextBox5.Text.Trim()));

                if (readerSrv.IsNameExists(TextBox1.Text.Trim()))
                {

                }
                else
                {
                    readerSrv.Add(TextBox1.Text.Trim(), TextBox2.Text.Trim(),int.Parse(TextBox5.Text.Trim()));
                }

                Response.Redirect("Login.aspx?name=" + TextBox1.Text);
            }
        }
    }
}