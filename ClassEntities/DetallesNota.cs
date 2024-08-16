using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class DetallesNota
    {
        public int iddetallenota { set; get; }
        public int nota { set; get; }
        public int material { set; get; }
        public int cantidad { set; get; }
        public int PrecioUnitario { set; get; }
        public string extra { set; get; }
    }
}
