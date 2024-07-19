using Org.BouncyCastle.Asn1.Cms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntities
{
    public class Horario
    {
        public int idhorario { get; set; }
        public int AsignacionID { get; set; }
        public int DiaID { get; set; }
        public int HrInicio { get; set; }
        public int HrFinal { get; set; }
        public int AulaID { get; set; }
    }
}
