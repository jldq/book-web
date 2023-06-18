using book.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace book.BLL
{
    public class LogService
    {
        bookDataContext db = new bookDataContext();

        public void Add(string username, string type, DateTime action_date,string action_table)
        {
            log logs = new log();
            logs.username = username;
            logs.type = type;
            logs.action_date = action_date;
            logs.action_table = action_table;

            db.log.InsertOnSubmit(logs);
            db.SubmitChanges();
        }
        public List<log> GetLogs(int count)
        {
            return (from p in db.log
                    orderby p.log_id descending
                    select p).ToList();
        }
    }
}
