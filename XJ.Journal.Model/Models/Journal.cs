using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Journal.Model.Models
{
    public class Journal
    {
        public Journal()
        {
            Issues = new HashSet<Issue>();
        }
        public int Id { get; set; }
        [Required]
        [StringLength(128)]
        public string JournalName { get; set; }

        public virtual ICollection<Issue> Issues { get; set; }
    }
}
