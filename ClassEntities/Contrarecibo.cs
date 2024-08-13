using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Contrarecibo
    {
        public int idcontrarecibo { set; get; }
        public DateTime fecha { set; get; }
        public int obra { set; get; }
        public string extra { set; get; }
    }
}
