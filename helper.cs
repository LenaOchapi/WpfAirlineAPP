using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfAirlineAPP.Models;

namespace WpfAirlineAPP
{
    internal class helper
    {
        private static AirlineEntities s_firstDBEntities;
        public static AirlineEntities GetContext()
        {
            if (s_firstDBEntities == null)
            {
                s_firstDBEntities = new AirlineEntities();
            }
            return s_firstDBEntities;
        }
        public void CreateUser(Models.Users users)
        {
            GetContext().Users.Add(users);
            GetContext().SaveChanges();
        }
        public void UpdateUser(Models.Users users)
        {
            s_firstDBEntities.Entry(users).State = EntityState.Modified;
            s_firstDBEntities.SaveChanges();
        }
        public void RemoveUser(int idUsers)
        {
            var users = s_firstDBEntities.Users.Find(idUsers);
            s_firstDBEntities.Users.Remove(users);
            s_firstDBEntities.SaveChanges();
        }
        public void FiltrUser()
        {
            var users = s_firstDBEntities.employees.Where(x => x.Name.StartsWith("М") || x.Name.StartsWith("А"));
        }
        public void SortUser()
        {
            var users = s_firstDBEntities.employees.OrderBy(x => x.Name);
        }
    }
}
