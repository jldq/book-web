using book.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_bookTree : System.Web.UI.UserControl
{
    bookService bookSrv=new bookService();
    TypeService TypeSrv=new TypeService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTree();
        }
    }
    public void BindTree()
    {
        var types = TypeSrv.GetTypes();
        foreach (var type in types)
        {
            TreeNode treeNode = new TreeNode();
            treeNode.Text = type.l_leixing;
            treeNode.Value=type.l_id.ToString();
            treeNode.NavigateUrl = "~/books.aspx?l_id="+type.l_id.ToString();
            TreeView1.Nodes.Add(treeNode);
            //BindTreeChild(treeNode, type.l_id);
        }
    }

    //public void BindTreeChild(TreeNode tn,int l_id)
    //{
    //    var books=bookSrv.GetBookBylid(l_id);
    //    foreach (var book in books)
    //    {
    //        TreeNode treeNode = new TreeNode();
    //        treeNode.Text = book.s_shuming;
    //        treeNode.Value=book.l_id.ToString();
    //        treeNode.NavigateUrl = "~/books.aspx?t_id=" +book.t_id.ToString();
    //        tn.ChildNodes.Add(treeNode);

    //    }
    //}
}