using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Periodos
    {
        public int idPeriodo { get; set; }
        public string NombrePeriodo { get; set; }
        public DateTime P_inicio { get; set; }
        public DateTime P_Fin { get; set; }
        public int Año { get; set; }
        public string Extra { get; set; }
    }
}
