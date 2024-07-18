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
    public class DivisionGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarDivisiones()
        {
            string instSql = "SELECT * FROM divisiones";
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
                throw new Exception("Error al mostrar Divisiones: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from divisiones where Id_Division = '" + NumId + "' ");
        }
        public string InsertarDivision(Divisiones nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO divisiones (NombreDivision, DescripcionDiv) VALUES ('{nueva.NombreDivision}', '{nueva.DescripcionDiv}');");
                return Mensaje = "Division registrada correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Division: {ex.Message}";
            }
        }
        public void EditarDivision(Divisiones nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE divisiones set NombreDivision = '{nueva.NombreDivision}', DescripcionDiv = '{nueva.DescripcionDiv}'  WHERE NombreDivision = '{NombreViejo}'");
        }
        public string[] NombresDivisiones()
        {
            return objBLL.EjecutaSqlResultados("select NombreDivision from divisiones");
        }
        public int IdDivisiones(string NomDiv)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select Id_Division from divisiones where NombreDivision = '{NomDiv}'"));
        }
        public string ObtenerNombreXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NombreDivision from divisiones where Id_Division = '{id}'");
        }
        public Divisiones ObtenerDivisionesPorNombre(string nombreDivision)
        {
            Divisiones divis = null;
            string instSql = $"SELECT * FROM divisiones WHERE NombreDivision = '{nombreDivision}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    divis = new Divisiones
                    {
                        Id_Division = Convert.ToInt32(row["Id_Division"]),
                        NombreDivision = row["NombreDivision"].ToString(),
                        DescripcionDiv = row["DescripcionDiv"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener division por nombre: " + ex.Message);
            }

            return divis;
        }
    }
}
