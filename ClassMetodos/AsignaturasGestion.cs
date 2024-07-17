using ClassBLLHorariosMySQL;
using ClassDALMySql;
using ClassEntities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public class AsignaturasGestion
    {
        private BLLHorarios objBLL = null;

        public DataTable MostrarAsignaturas()
        {
            string instSql = "SELECT * FROM asignaturas";
            DataTable resultTable = null;

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0)
                {
                    resultTable = ds.Tables[0];
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al mostrar asignaturas: " + ex.Message);
            }

            return resultTable;
        }
    }
}
