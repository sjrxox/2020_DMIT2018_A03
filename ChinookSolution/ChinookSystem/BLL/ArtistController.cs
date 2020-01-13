﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


#region Additional Namespaces
using ChinookSystem.DAL;
using ChinookSystem.Data.Entities;
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class ArtistController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Artist> Artist_List()
        {
            using (var context = new ChinookContext())
            {
                return context.Artists.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Artist Artist_FindByID (int artistid)
        {
            using (var context = new ChinookContext())
            {
                return context.Artists.Find(artistid);
            }
        }
    }
}
