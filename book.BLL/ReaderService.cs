using book.DAL;
using System;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace book.BLL
{
    public class ReaderService
    {
        bookDataContext db=new bookDataContext();

        public List<kehubiao> GetReader(int count)
        {
            return (from k in db.kehubiao
                    orderby k.k_id descending
                    select k).ToList();
        }

        public kehubiao GetReaderByName(string name)
        {
            return (from r in db.kehubiao
                    where r.k_xingming == name
                    select r).First();
        }

        public kehubiao GetReaderByKid(int kid)
        {
            return (from r in db.kehubiao
                    where r.k_id== kid
                    select r).First();
        }

        public kehubiao GetReaders()
        {
            return (from r in db.kehubiao
                    select r).First();
        }
        public void Add(string name, string Email, int age)
        {
            kehubiao reader = new kehubiao();
            reader.k_Email = Email;
            reader.k_xingming = name;
            reader.k_age = age;

            db.kehubiao.InsertOnSubmit(reader);
            db.SubmitChanges();
        }

        public void Update(int k_id, string name, string Email, int age)
        {
            kehubiao reader = (from i in db.kehubiao
                              where i.k_id == k_id
                              select i).First();
            reader.k_xingming = name;
            reader.k_Email = Email;
            reader.k_age = age;

            db.SubmitChanges();
        }

        public bool IsNameExists(string name)
        {
            kehubiao reader = (from c in db.kehubiao
                               where c.k_xingming == name
                               select c).FirstOrDefault();
            if (reader != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<kehubiao> GetReaderBySearchText(string searchText)
        {
            return (from c in db.kehubiao
                    where SqlMethods.Like(c.k_xingming, "%" + searchText + "%")
                    select c).ToList();
        }
    }
}
