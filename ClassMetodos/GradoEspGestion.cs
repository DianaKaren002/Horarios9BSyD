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
    public class GradoEspGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarGradosEsp()
        {
            string instSql = "SELECT * FROM gradosespecialidad";
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
                throw new Exception("Error al mostrar Grados especialidad: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from gradosespecialidad where idgradosespecialidad = '" + NumId + "' ");
        }
        public string InsertarGradosEspecialidad(GradosEspecialidad nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO gradosespecialidad (grado, Extra) VALUES ('{nueva.grado}', '{nueva.Extra}');");
                return Mensaje = "Grado Especialidad registrada correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Grado Especialidad: {ex.Message}";
            }
        }
        public void EditarGradoEsp(GradosEspecialidad nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE gradosespecialidad set grado = '{nueva.grado}', Extra = '{nueva.Extra}'  WHERE grado = '{NombreViejo}'");
        }
        public string[] NombresGrados()
        {
            return objBLL.EjecutaSqlResultados("select grado from gradosespecialidad");
        }
        public GradosEspecialidad ObtenerGradosPorNombre(string nombreGrados)
        {
            GradosEspecialidad gradEsp = null;
            string instSql = $"SELECT * FROM gradosespecialidad WHERE grado = '{nombreGrados}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    gradEsp = new GradosEspecialidad
                    {
                        idgradosespecialidad = Convert.ToInt32(row["idgradosespecialidad"]),
                        grado = row["grado"].ToString(),
                        Extra = row["Extra"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Grado Especialidad por nombre: " + ex.Message);
            }

            return gradEsp;
        }
    }
}
