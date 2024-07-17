using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Grupos
    {
        public int Idgrupo { get; set; }
        public string NomGrupo { get; set; }
        public int Cuatrimestre { get; set; }
        public string Turno { get; set; }
        public int PeriodoID { get; set; }
        public int AulaID { get; set; }
        public int TutorID { get; set; }
        public int EspecialidadID { get; set; }
    }
}
