using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassDALMySql;

namespace ClassBLLHorariosMySQL
{
    public class BLLHorarios
    {
        private string cad = "";
        private DALMySQL objdal = null;
        public BLLHorarios(string cadeconex)
        {
            cad = cadeconex;
            objdal = new DALMySQL(cad);
        }
        public string probarConexion()
        {
            string mensaje = "";
            objdal.abrirConexion(ref mensaje);
            return mensaje;
        }

    }
}
