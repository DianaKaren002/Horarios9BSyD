using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Asignatura
    {
        public int idasignatura { get; set; }
        public string NomAsignatura { get; set; }
        public string DescripcionAsig { get; set; }
        public int HrsxSemana { get; set; }
        public int Cuatrimestre { get; set; }
    }
}
