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
    
    public class TypeService
    {
        bookDataContext db = new bookDataContext();

        public List<leixingbiao> GetTypes()
        {
            return (from c in db.leixingbiao
                    select c).ToList();
        }

        public void Add(int l_id,string l_leixing,int l_qixian,string l_miaoshu)
        {
            leixingbiao types=new leixingbiao();
            types.l_id = l_id;  
            types.l_leixing = l_leixing;
            types.l_qixian = l_qixian;
            types.l_miaoshu = l_miaoshu;

            db.leixingbiao.InsertOnSubmit(types);
            db.SubmitChanges();
        }

        public void Update(int l_id,string l_leixing,int l_qixian,string l_miaoshu)
        {
            var type=(from t in db.leixingbiao
                      where t.l_id == t.l_id
                      select t).First();
            type.l_leixing = l_leixing;
            type.l_qixian = l_qixian;
            type.l_miaoshu = l_miaoshu;

            db.SubmitChanges();
        }

        public void Delete(int l_id)
        {
            var type = (from i in db.leixingbiao
                        where i.l_id == l_id
                        select i).First();

            db.leixingbiao.DeleteOnSubmit(type);
            db.SubmitChanges();
        }
    }
}
