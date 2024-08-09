using ClassBLLHorariosMySQL;
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
    public class PeriodosGestion
    {
        private BLLHorarios objBLL = new BLLHorarios();

        public DataTable MostrarPeriodos()
        {
            string instSql = "SELECT idPeriodo, NombrePeriodo, DATE_FORMAT(P_inicio, '%Y-%m-%d') AS P_inicio, DATE_FORMAT(P_Fin, '%Y-%m-%d') AS P_Fin, Año, Extra FROM periodos";
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
                throw new Exception("Error al mostrar Periodos: " + ex.Message);
            }

            return resultTable;
        }

        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from periodos where idPeriodo = '" + NumId + "' ");
        }
        public string InsertarPeriodos(Periodos nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO periodos (Nombreperiodo, P_inicio, P_Fin, Año, Extra) VALUES ('{nueva.NombrePeriodo}', '{nueva.P_inicio}', '{nueva.P_Fin}', '{nueva.Año}', '{nueva.Extra}');");
                return Mensaje = "Periodo registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Periodo: {ex.Message}";
            }
        }
        public void EditarPeriodo(Periodos nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE periodos set NombrePeriodo = '{nueva.NombrePeriodo}', P_inicio = '{nueva.P_inicio}', P_Fin = '{nueva.P_Fin}', Año = '{nueva.Año}', Extra = '{nueva.Extra}'  WHERE NombrePeriodo = '{NombreViejo}'");
        }
        public string[] NombresPeriodos()
        {
            return objBLL.EjecutaSqlResultados("select NombrePeriodo from periodos");
        }
        public int IdPeriodos(string Nomper)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select idPeriodo from periodos where NombrePeriodo = '{Nomper}'"));
        }
        public string ObtenerNombrePerXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NombrePeriodo from periodos where idPeriodo = '{id}'");
        }
        public Periodos ObtenerPeriodosPorNombre(string nomPe)
        {
            Periodos peri = null;
            string instSql = "SELECT * FROM periodos WHERE NombrePeriodo = @NombrePeriodo";

            try
            {
                DataSet ds = objBLL.ConsultaTablaConParametros(instSql, new MySqlParameter("@NombrePeriodo", nomPe));
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    DateTime fechaInicio;
                    DateTime fechaFin;

                    bool fechaInicioValida = DateTime.TryParse(row["P_inicio"].ToString(), out fechaInicio);
                    bool fechaFinValida = DateTime.TryParse(row["P_Fin"].ToString(), out fechaFin);

                    peri = new Periodos
                    {
                        idPeriodo = Convert.ToInt32(row["idPeriodo"]),
                        NombrePeriodo = row["NombrePeriodo"].ToString(),
                        P_inicio = fechaInicioValida ? fechaInicio : DateTime.MinValue,
                        P_Fin = fechaFinValida ? fechaFin : DateTime.MinValue,
                        Año = Convert.ToInt32(row["Año"]),
                        Extra = row["Extra"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Periodos por nombre: " + ex.Message);
            }

            return peri;
        }
        public string[] PeriodoInicio()
        {
            return objBLL.EjecutaSqlResultados("select P_inicio from periodos");
        }
        public string[] PeriodoFin()
        {
            return objBLL.EjecutaSqlResultados("select P_Fin from periodos");
        }

    }
}
