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
    public class DiasGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarDias()
        {
            string instSql = "SELECT * FROM diasemana";
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
                throw new Exception("Error al mostrar Dias: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from diasemana where iddia = '" + NumId + "' ");
        }
        public string InsertarDia(DiaSemana nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO diasemana (NomDia) VALUES ('{nueva.NomDia}');");
                return Mensaje = "Dia registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Dia: {ex.Message}";
            }
        }
        public void EditarDia(DiaSemana nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE diasemana set NomDia = '{nueva.NomDia}'WHERE NomGrupo = '{NombreViejo}'");
        }
        public string[] NombresDias()
        {
            return objBLL.EjecutaSqlResultados("select NomDia from diasemana");
        }
        public int DevuelveIDDia(string NomDia)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select iddia from diasemana where NomDia = '{NomDia}'"));
        }
        public string ObtenerNombreDiaXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NomDia from diasemana where iddia = '{id}'");
        }
        public DiaSemana ObtenerDiaPorNombre(string nombredia)
        {
            DiaSemana dia = null;
            string instSql = $"SELECT * FROM diasemana WHERE NomDia = '{nombredia}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    dia = new DiaSemana
                    {
                        iddia = Convert.ToInt32(row["iddia"]),
                        NomDia = row["NomDia"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Dia por nombre: " + ex.Message);
            }

            return dia;
        }
    }
}
