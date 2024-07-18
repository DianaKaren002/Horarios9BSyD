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
    public class EdificiosGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarEdificios()
        {
            string instSql = "SELECT e.idEdificio, e.NombreEdificio, e.DescripcionEdif, d.NombreDivision FROM edificios e INNER JOIN divisiones d ON e.DivisionID = d.Id_Division";
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
                throw new Exception("Error al mostrar edificios: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from edificios where idEdificio = '" + NumId + "' ");
        }
        public string Insertaredificio(Edificios nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO edificios (NombreEdificio, DescripcionEdif, DivisionID) VALUES ('{nueva.NombreEdificio}', '{nueva.DescripcionEdif}', '{nueva.DivisionId}');");
                return Mensaje = "Edificio registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Edificio: {ex.Message}";
            }
        }
        public void EditarEdificios(Edificios nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE edificios set NombreEdificio = '{nueva.NombreEdificio}', DescripcionEdif = '{nueva.DescripcionEdif}', DivisionID = '{nueva.DivisionId}'  WHERE NombreEdificio = '{NombreViejo}'");
        }
        public string[] NombresEdificios()
        {
            return objBLL.EjecutaSqlResultados("select NombreEdificio from edificios");
        }
        public int IdEdificios(string Nomedif)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select idEdificio from edificios where NombreEdificio = '{Nomedif}'"));
        }
        public string ObtenerNombreEdifXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NombreEdificio from edificios where idEdificio = '{id}'");
        }
        public Edificios ObteneredificiosPorNombre(string nombreEdificio)
        {
            Edificios edif = null;
            string instSql = $"SELECT * FROM edificios WHERE NombreEdificio = '{nombreEdificio}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    edif = new Edificios
                    {
                        idEdificio = Convert.ToInt32(row["idEdificio"]),
                        NombreEdificio = row["NombreEdificio"].ToString(),
                        DescripcionEdif = row["DescripcionEdif"].ToString(),
                        DivisionId =Convert.ToInt32( row["DivisionID"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener edificio por nombre: " + ex.Message);
            }

            return edif;
        }
       
        
    }
}
