using ChinookSystem.DAL;
using ChinookSystem.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.BLL
{
    public class AlbumController
    {
        public List<Album> Album_List()
        {
            using (var context = new ChinookContext())
            {
                return context.Albums.ToList();
            }
        }

        public Album Album_FindByID(int albumid)
        {
            using (var context = new ChinookContext())
            {
                return context.Albums.Find(albumid);
            }
        }
    }
}
