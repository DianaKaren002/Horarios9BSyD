using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Especialidades
    {
        public int idEspecialidad { get; set; }
        public string NombreEsp { get; set; }
        public string DescripcionEsp { get; set; }
        public int DivisionID { get; set; }
        public int gradoEspecialidad { get; set; }
    }
}
