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
    // Identify the sql entity (table) this class maps
    [Table("Artists")]
    public class Artist
    {
        // Fully implemented properties will be used for nullable strings

        private string _Name;

        [Key]
        public int ArtistId { set; get; }


        [StringLength(120, ErrorMessage = "Artist name is limited to 120 characters")]
        public string Name
        {
            get
            {
                return Name;
            }
            set
            {
                // Shorter way
                //_Name = string.IsNullOrEmpty(value) ?
                //    null : value;

                if (string.IsNullOrEmpty(value))
                {
                    Name = null;
                }
                else
                {
                    Name = value;
                }
            }
        }

        // Virtual navigational properties
        // these properties do not contain data
        // these properties form a virtual relationship
        //          between the entity classes
        // you create the appropriate virtual properties such as
        //          as you are mapping the ERD relationship that
        //          exists in your database

        public virtual ICollection<Album> Albums { get; set; }
    }


}
