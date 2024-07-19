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
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

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
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from asignaturas where idasignatura = '" + NumId + "' ");
        }
        public string InsertarAsignatura(Asignatura nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO asignaturas (NomAsignatura,DescripcionAsig, HrsxSemana, Cuatrimestre) VALUES ('{nueva.NomAsignatura}', '{nueva.DescripcionAsig}', '{nueva.HrsxSemana}', '{nueva.Cuatrimestre}')");
                return Mensaje = "Área insertada correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al insertar el área: {ex.Message}";
            }
        }
        public void EditarAsignatura(Asignatura nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE asignaturas set NomAsignatura = '{nueva.NomAsignatura}',DescripcionAsig = '{nueva.DescripcionAsig}', HrsxSemana='{nueva.HrsxSemana}', Cuatrimestre = '{nueva.Cuatrimestre}' WHERE NomAsignatura = '{NombreViejo}'");
        }
        public string[] NombresAsignaturas()
        {
            return objBLL.EjecutaSqlResultados("select NomAsignatura from asignaturas");
        }
        public int DevuelveIDAsignatura(string Nom)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select idasignatura from asignaturas where NomAsignatura = '{Nom}'"));
        }
        public Asignatura ObtenerAsignaturaPorNombre(string nombreAsignatura)
        {
            Asignatura asignatura = null;
            string instSql = $"SELECT * FROM asignaturas WHERE NomAsignatura = '{nombreAsignatura}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    asignatura = new Asignatura
                    {
                        idasignatura = Convert.ToInt32(row["IdAsignatura"]),
                        NomAsignatura = row["NomAsignatura"].ToString(),
                        DescripcionAsig = row["DescripcionAsig"].ToString(),
                        HrsxSemana = Convert.ToInt32(row["HrsxSemana"]),
                        Cuatrimestre = Convert.ToInt32(row["Cuatrimestre"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la asignatura por nombre: " + ex.Message);
            }

            return asignatura;
        }
    }
}
