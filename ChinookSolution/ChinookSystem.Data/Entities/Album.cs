using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion

namespace ChinookSystem.Data.Entities
{
    [Table("Albums")]
    public class Album
    {
        private string _ReleaseLabel;

        [Key]
        public int AlbumId { get; set; }

        [Required(ErrorMessage = "Album Title is required")]
        [StringLength(160, ErrorMessage = "Album title is limited to 160 characters")]
        public string Title { get; set; }

        //Problem with the artist id string length cause its not a string, its an int
        //[StringLength(160, ErrorMessage = "Artist ID is required")]
        public int ArtistId { get; set; }

        [Required(ErrorMessage = "Album release year is required")]
        public int ReleaseYear { get; set; }

        [StringLength(50, ErrorMessage = "Release lable is limited to 50 characters")]
        public string ReleaseLabel
        {
            get
            {
                //return ReleaseLabel;
                return _ReleaseLabel;
            }
            set
            {
                _ReleaseLabel = string.IsNullOrEmpty(value) ?
                    null : value;
                //if (string.IsNullOrEmpty(value))
                //{
                //    ReleaseLabel = null;
                //}
                //else
                //{
                //    ReleaseLabel = value;
                //}
            }
        }

        public virtual Artist Artist { get; set; }
        
        //public virtual ICollection<Track> Tracks { get; set; }

    }
}

