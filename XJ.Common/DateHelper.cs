using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XJ.Common
{
    public class DateHelper
    {
        public static string GetDateEnFormat(DateTime dt)
        {
            string d = dt.Day.ToString();
            string m = dt.ToString("MMMM",new System.Globalization.CultureInfo("en-us"));
            string y = dt.Year.ToString();
            return d + "&nbsp;" + m + "&nbsp;" + y;
            
        
        }
    }
}
