using ChinookSystem.Data.POCOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ChinookSystem.Data.DTOs
{
    public class AlbumArtistList
    {
        public int ArtistId { get; set; }
        public string Name { get; set; }

        List<ListDDL> AlbumList { get; set; }
    }
}
