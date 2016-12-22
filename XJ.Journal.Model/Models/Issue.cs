using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Journal.Model.Models
{
    public class Issue
    {
        
        public int Id { get; set; }

        [StringLength(128)]
        [Required]
        public string IssueName { get; set; }

        public DateTime PublishDate { get; set; }

        [Required]
        public virtual Journal Journal { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
    }
}
