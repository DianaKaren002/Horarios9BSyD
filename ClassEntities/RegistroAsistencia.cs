using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class RegistroAsistencia
    {
        public int idRegistro { get; set; }
        public DateTime Fecha { get; set; }
        public int HorarioID { get; set; }
        public string Tema { get; set; }
        public int TotalAlumnos { get; set; }
        public string observaciones { get; set; }
    }
}
