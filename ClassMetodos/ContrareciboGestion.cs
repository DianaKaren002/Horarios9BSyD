using ClassBLLHorariosMySQL;
using ClassEntities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public class ContrareciboGestion
    {
        private BLLHorarios conexion = new BLLHorarios();
        public DataTable MostrarContraRecibo()
        {
            string instSql = "SELECT c.idcontrarecibo, " +
                             "COALESCE(c.fecha, '0001-01-01') AS fecha, " +  
                             "o.NombreObra, o.Direccion, COALESCE(o.FechaInicio, '0001-01-01') AS FechaInicio, " +
                             "COALESCE(o.FechaFinal, '0001-01-01') AS FechaFinal, o.Dueño, o.Responsable, " +
                             "o.Tel_Resp, o.Correo_Resp, c.extra " +
                             "FROM contrarecibo c " +
                             "INNER JOIN obra o ON c.obra = o.idObra;";

            DataTable resultTable = new DataTable();

            try
            {
                DataSet ds = conexion.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0)
                {
                    resultTable = ds.Tables[0];
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al mostrar Detalles: " + ex.Message);
            }

            return resultTable;
        }

        public void Bajas(int NumId)
        {
            conexion.EjecutaInstruccion("delete from detallecontrarecibo where iddetallecontrar = '" + NumId + "' ");
        }
        public string InsertarContrarecibo(Contrarecibo nueva)
        {
            string Mensaje;
            try
            {
                conexion.EjecutaInstruccion($"INSERT INTO contrarecibo (fecha, obra, extra)" +
                    $" VALUES (NOW(), '{nueva.obra}', '{nueva.extra}');");
                return Mensaje = "Contrarecibo registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Contrarecibo: {ex.Message}";
            }
        }
        
       
        public int[] Ids()
        {
            return conexion.EjecutaSqlResultadosInt("select idAsignacion from asignacioncuatrimestral");
        }
        public int DevuelveIDObraXNombre(string nombreObra)
        {
            return Convert.ToInt32(conexion.ObtenerUnicoResultado($"select idObra from obra where NombreObra = '{nombreObra}'"));
        }
        public int DevuelveIDContrareciboXIdObra(int obra)
        {
            return Convert.ToInt32(conexion.ObtenerUnicoResultado($"select idcontrarecibo from contrarecibo where obra = '{obra}'"));
        }
        public string[] NombresObras()
        {
            return conexion.EjecutaSqlResultados("select NombreObra from obra;");
        }

    }
}
