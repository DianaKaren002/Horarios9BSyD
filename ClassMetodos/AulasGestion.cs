using ClassBLLHorariosMySQL;
using ClassEntities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public class AulasGestion
    {
        private BLLHorarios objBLL = new BLLHorarios();

        public DataTable MostrarAulas()
        {
            string instSql = "SELECT a.idAula, a.NombAula , a.Descripcion, e.NombreEdificio FROM aulas a INNER JOIN edificios e ON a.EdificioID = e.idEdificio ";
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
                throw new Exception("Error al mostrar Aulas: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from aulas where idAula = '" + NumId + "' ");
        }
        public string InsertarAulas(Aulas nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO aulas (NombAula, Descripcion, EdificioID) VALUES ('{nueva.NombAula}', '{nueva.Descripcion}', '{nueva.EdificioID}');");
                return Mensaje = "Aula registrada correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Aula: {ex.Message}";
            }
        }
        public void EditarAula(Aulas nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE aulas set NombAula = '{nueva.NombAula}', Descripcion = '{nueva.Descripcion}', EdificioID = '{nueva.EdificioID}'  WHERE NombAula = '{NombreViejo}'");
        }
        public string[] NombresAulas()
        {
            return objBLL.EjecutaSqlResultados("select NombAula from aulas");
        }
        public int DevuelveIDAula(string nomAu)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select idAula from aulas where NombAula = '{nomAu}'"));
        }
        public string ObtenerNombreAulaXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NombAula from aulas where idAula = '{id}'");
        }
        public Aulas ObtenerAulasPorNombre(string nombreAu)
        {
            Aulas esp = null;
            string instSql = $"SELECT * FROM aulas WHERE NombAula = '{nombreAu}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    esp = new Aulas
                    {
                        idAula = Convert.ToInt32(row["idAula"]),
                        NombAula = row["NombAula"].ToString(),
                        Descripcion = row["Descripcion"].ToString(),
                        EdificioID = Convert.ToInt32(row["EdificioID"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Aula por nombre: " + ex.Message);
            }

            return esp;
        }
    }
}
