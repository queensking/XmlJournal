using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Journal.Model.Models
{
    public class Affiliation
    {
        public Affiliation()
        {
            Articles = new HashSet<Article>();
        }
        public int Id { get; set; }
        [StringLength(512)]
        [Required]
        public string AffiliationName { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
    }
}
