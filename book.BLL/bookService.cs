using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using book.DAL;
using System.Data.Linq.SqlClient;
using System.IO;

namespace book.BLL
{
    public class bookService
    {
        bookDataContext db=new bookDataContext();
        public void Add(string s_img,string ISBN, string s_shuming, int l_id, string s_zuozhe,
     string s_chubanshe, DateTime s_cbriqi, decimal s_danjia, int s_kucun,string s_jianjie,int s_cishu)
        {
            tushubiao book = new tushubiao();
            book.s_img = s_img;
            book.ISBN = ISBN;
            book.s_shuming = s_shuming;
            book.l_id = l_id;
            book.s_zuozhe = s_zuozhe;
            book.s_chubanshe = s_chubanshe;
            book.s_cbriqi = s_cbriqi;
            book.s_danjia = s_danjia;
            book.s_kucun = s_kucun;
            book.s_jianjie = s_jianjie;
            book.s_cishu = s_cishu;

            db.tushubiao.InsertOnSubmit(book);
            db.SubmitChanges();
        }
        public void Update( string ISBN, string s_shuming, int l_id, string s_zuozhe,
    string s_chubanshe, DateTime s_cbriqi, decimal s_danjia, int s_kucun,int s_yijie, string s_jianjie, int s_cishu)
        {
            tushubiao book =(from i in db.tushubiao
                             where i.ISBN==ISBN
                             select i).First();
            book.s_shuming = s_shuming;
            book.l_id = l_id;
            book.s_zuozhe = s_zuozhe;
            book.s_chubanshe = s_chubanshe;
            book.s_cbriqi = s_cbriqi;
            book.s_danjia = s_danjia;
            book.s_kucun = s_kucun;
            book.s_jianjie = s_jianjie;
            book.s_yijie = s_yijie;
            book.s_cishu = s_cishu;

            db.SubmitChanges();
        }
        public List<tushubiao> GetTS(int count)
        {
            return (from p in db.tushubiao
                    orderby p.t_id descending
                    select p).ToList();
        }

        public List<tushubiao> GetXS(int count)
        {
            return (from p in db.tushubiao
                    orderby p.t_id descending
                    select p).Take(count).ToList();
        }

        public tushubiao GetBookISBN(string ISBN)
        {
            return (from j in db.tushubiao
                    where j.ISBN == ISBN
                    select j).First();
        }
        /// <summary>
        /// IsExitBS()方法判断leixingbiao中是否已有数据
        /// </summary>
        /// <returns>返回值true表示leixingbiao中无数据；返回值false表示leixingbiao中都有数据</returns>
        public bool IsExitBS()
        {
            var types = from c in db.leixingbiao
                             select c;
            
            if (types.Count() == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// IsExitISBN()判断是否存在指定的图书
        /// </summary>
        /// <param name="name">指定的书名</param>
        /// <returns>返回值true表示tushubiao中存在指定的书；返回值false表示tushubiao中不存在指定的书</returns>
        public bool IsExitISBN(string ISBN)
        {
            var books = from c in db.tushubiao
                           where c.ISBN == ISBN
                           select c;
            if (books.Count() != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int GetBookByLid(int l_id)
        {
            return (from l in db.tushubiao
                    where l.l_id == l_id
                    select l).Count();
        }
        public List<tushubiao> GetBookBylid(int l_id)
        {
            return (from l in db.tushubiao
                    where l.l_id == l_id
                    select l).ToList();
        }

        public void DeleteBook(int t_id)
        {
            var book = (from t in db.tushubiao
                        where t.t_id == t_id
                        select t).First();

            db.tushubiao.DeleteOnSubmit(book);
            db.SubmitChanges();
        }

        public List<tushubiao> GetbookByTidOrLid(string t_id,string l_Id)
        {
            if (!string.IsNullOrEmpty(t_id))
            {
                return (from c in db.tushubiao
                        where c.t_id == int.Parse(t_id)
                        select c).ToList();
            }
            else
            {
                return (from p in db.tushubiao
                        where p.l_id == int.Parse(l_Id)
                        select p).ToList();
            }
            
        }
        public List<tushubiao> Getbooks(string t_id)
        {
                return (from c in db.tushubiao
                        where c.t_id == int.Parse(t_id)
                        select c).ToList();

        }
        public List<tushubiao> GetBookBySearchText(string searchText)
        {
            return(from c in db.tushubiao
                   where SqlMethods.Like(c.s_shuming,"%"+searchText+"%")
                   select c).ToList();
        }

        public void UpdateZT(int t_id,int s_kucun, int s_yijie, int s_cishu)
        {
            tushubiao book = (from i in db.tushubiao
                              where i.t_id == t_id
                              select i).First();

            book.s_yijie = s_yijie;
            book.s_cishu = s_cishu;
            book.s_kucun = s_kucun;

            db.SubmitChanges();
        }
        public void UpdateKC(string s_shuming, int s_kucun)
        {
            tushubiao book = (from i in db.tushubiao
                              where i.s_shuming == s_shuming
                              select i).First();

            book.s_kucun = s_kucun;

            db.SubmitChanges();
        }

        public List<tushubiao> GetbookTJ()
        {
            return (from c in db.tushubiao
                    orderby c.s_cishu descending
                    select c).ToList();
        }

        public List<tushubiao> GetTJS(int count)
        {
            return (from p in db.tushubiao
                    orderby p.s_cishu descending
                    select p).Take(count).ToList();
        }

        public tushubiao GetbooksByTid(int t_id)
        {
            return (from c in db.tushubiao
                    where c.t_id ==t_id
                    select c).First();
        }
    }
}
