using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace book.BLL
{
    public class CmoneyService
    {
        bookDataContext db = new bookDataContext();
        public List<Cmoney> GetFJ(int count)
        {
            return (from p in db.Cmoney
                    orderby p.m_id descending
                    select p).ToList();
        }

        public List<Cmoney> GetFJByLeixing(string leixing)
        {
            return (from p in db.Cmoney
                    where p.m_leixing==leixing
                    select p).ToList();
        }

        public void Add(string s_shuming,string name,decimal moneys,string m_leixing,string m_zhuangtai)
        {
            Cmoney moneyss = new Cmoney();
            moneyss.name = name;
            moneyss.moneys = moneys;
            moneyss.m_leixing = m_leixing;
            moneyss.s_shuming = s_shuming;
            moneyss.m_zhuangtai = m_zhuangtai;
            moneyss.m_time = DateTime.Now;

            db.Cmoney.InsertOnSubmit(moneyss);
            db.SubmitChanges();
        }
        public void Add1(string s_shuming, string name, decimal moneys, string m_leixing,decimal s_danjia,string m_zhuangtai)
        {
            Cmoney moneyss = new Cmoney();
            moneyss.name = name;
            moneyss.moneys = moneys;
            moneyss.m_leixing = m_leixing;
            moneyss.s_shuming = s_shuming;
            moneyss.s_danjia = s_danjia;
            moneyss.m_time = DateTime.Now;
            moneyss.m_zhuangtai = m_zhuangtai;

            db.Cmoney.InsertOnSubmit(moneyss);
            db.SubmitChanges();
        }

        public Cmoney GetFJByMid(int m_id)
        {
            return (from p in db.Cmoney
                    where p.m_id == m_id
                    select p).First();
        }
    }
}
