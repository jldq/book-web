using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace book.BLL
{
    public class BorrowService
    {
        bookDataContext db=new bookDataContext();

        public List<jiehuanbiao> GetJH(int count)
        {
            return (from j in db.jiehuanbiao
                    select j).ToList();
        }
        public List<jiehuanbiao> GetJHs(int count)
        {
            return (from j in db.jiehuanbiao
                    orderby j.j_id descending
                    select j).ToList();
        }
        public void Add(int t_id,int c_id,DateTime j_jiechu,string name,DateTime j_yingh)
        {
            jiehuanbiao b = new jiehuanbiao();
            b.t_id = t_id;
            b.c_id= c_id;
            b.j_jiechu = j_jiechu;
            b.name = name;   
            b.j_yingh = j_yingh;

            db.jiehuanbiao.InsertOnSubmit(b);
            db.SubmitChanges();
        }
        public void UpdateHS(int j_id, DateTime j_huan)
        {
            jiehuanbiao k = (from i in db.jiehuanbiao
                              where i.j_id == j_id
                              select i).First();
            k.j_huan = j_huan;

            db.SubmitChanges();
        }
        public void SubmitXJ(int j_id, string j_zhuangtai)
        {
            jiehuanbiao book = (from i in db.jiehuanbiao
                                where i.j_id == j_id
                                select i).First();

            book.j_zhuangtai = j_zhuangtai;

            db.SubmitChanges();
        }
        public void SubmitXJGet(int j_id, string j_zhuangtai,DateTime j_yingh)
        {
            jiehuanbiao b = (from i in db.jiehuanbiao
                                where i.j_id == j_id
                                select i).First();

            b.j_zhuangtai = j_zhuangtai;
            b.j_yingh = j_yingh;

            db.SubmitChanges();
        }

        public void SubmitXJGiveup(int j_id)
        {
            jiehuanbiao b = (from i in db.jiehuanbiao
                             where i.j_id == j_id
                             select i).First();

            b.j_zhuangtai = "已放弃";

            db.SubmitChanges();
        }

        public List<jiehuanbiao> GetCHing(DateTime xz)
        {
            return (from c in db.jiehuanbiao
                    where c.j_yingh < xz && c.j_huan == null
                    select c).ToList();
        }

        public jiehuanbiao GetJHByJid(int j_id)
        {
            return (from q in db.jiehuanbiao
                    where q.j_id == j_id
                    select q).First();
        }

        public void SubmitXJNot(int j_id)
        {
            jiehuanbiao b = (from i in db.jiehuanbiao
                             where i.j_id == j_id
                             select i).First();

            b.j_zhuangtai = "已审核";

            db.SubmitChanges();
        }

        public void SubmitBeiZhu(int j_id,string bz)
        {
            jiehuanbiao b = (from i in db.jiehuanbiao
                             where i.j_id == j_id
                             select i).First();

            b.j_beizhu = bz;

            db.SubmitChanges();
        }

        public void AAdd(int t_id, int k_id, DateTime j_jiechu, string name, DateTime j_yingh)
        {
            jiehuanbiao b = new jiehuanbiao();
            b.t_id = t_id;
            b.k_id = k_id;
            b.j_jiechu = j_jiechu;
            b.name = name;
            b.j_yingh = j_yingh;

            db.jiehuanbiao.InsertOnSubmit(b);
            db.SubmitChanges();
        }
    }
}
