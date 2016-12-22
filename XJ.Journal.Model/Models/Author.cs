using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Journal.Model.Models
{
    public class Author
    {
        public Author()
        {
            Articles = new HashSet<Article>();
        }

        public int Id { get; set; }
        [Required]
        [StringLength(128)]
        public string AuthorName { get; set; }
        

        public virtual ICollection<Article> Articles { get; set; }
    }
}
