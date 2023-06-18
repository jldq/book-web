using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace book.BLL
{
    public class UrgeService
    {
        bookDataContext db = new bookDataContext();

        public List<cuihuanbiao> GetCH(int count)
        {
            return (from c in db.cuihuanbiao
                    orderby c.c_id descending
                    select c).ToList();
        }


        public void add(string name, int t_id, int k_id, string nr)
        {
            cuihuanbiao cuis = new cuihuanbiao();

            cuis.c_name = name;
            cuis.t_id = t_id;
            cuis.k_id = k_id;
            cuis.c_riqi = DateTime.Now;
            cuis.c_neirong = nr;

            db.cuihuanbiao.InsertOnSubmit(cuis);
            db.SubmitChanges();
        }
        public void SubmitBeiZhu(int c_id, string bz)
        {
            cuihuanbiao b = (from i in db.cuihuanbiao
                             where i.c_id == c_id
                             select i).First();

            b.c_beizhu = bz;

            db.SubmitChanges();
        }
    }
}
