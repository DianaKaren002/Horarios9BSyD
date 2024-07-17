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
    public class DocentesGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarDocentes()
        {
            string instSql = "SELECT * FROM docentes";
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
                throw new Exception("Error al mostrar Docentes: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from docentes where idDocente = '" + NumId + "' ");
        }
        public string InsertarDocente(Docentes nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO docentes (Nombre, A_Paterno, A_Materno, Extra) VALUES ('{nueva.Nombre}', '{nueva.A_Paterno}', '{nueva.A_Materno}', '{nueva.Extra}')");
                return Mensaje = "Docente registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar docente: {ex.Message}";
            }
        }
        public void EditarDocente(Docentes nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE docentes set Nombre = '{nueva.Nombre}', A_Paterno = '{nueva.A_Paterno}', A_Materno='{nueva. A_Materno}', Extra = '{nueva.Extra}' WHERE Nombre = '{NombreViejo}'");
        }
        public string[] NombresDocentes()
        {
            return objBLL.EjecutaSqlResultados("select Nombre from docentes");
        }
        public Docentes ObtenerDocentePorNombre(string nombreDocente)
        {
            Docentes docente = null;
            string instSql = $"SELECT * FROM docentes WHERE Nombre = '{nombreDocente}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    docente = new Docentes
                    {
                        idDocente = Convert.ToInt32(row["idDocente"]),
                        Nombre = row["Nombre"].ToString(),
                        A_Paterno = row["A_Paterno"].ToString(),
                        A_Materno = row["A_Materno"].ToString() ,
                        Extra = row["Extra"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener al Docente por nombre: " + ex.Message);
            }

            return docente;
        }
    }
}
