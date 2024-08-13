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
    public class DetalleContrarGestion
    {
        private BLLHorarios conexion = new BLLHorarios();
        public DataTable MostrarDetalleContrar()
        {
            string instSql = "select \r\no.NombreObra,\r\no.Direccion,\r\no.FechaInicio,\r\no.FechaFinal,\r\no.Dueño,\r\no.Responsable,\r\no.Tel_Resp,\r\no.Correo_Resp,\r\ndc.total,\r\nn.cantidad,\r\nn.PrecioUnitario,\r\nnc.numeronota\r\nfrom contrarecibo c \r\ninner join obra o on c.obra=o.idObra\r\ninner join detallecontrarecibo dc on dc.contrarecibo = c.idcontrarecibo\r\ninner join detallenota n on n.iddetallenota = dc.nota\r\ninner join notacompra nc on nc.idnotacompra = n.nota;";

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
                throw new Exception("Error al mostrar Contrarecibo: " + ex.Message);
            }

            return resultTable;
        }

        public void Bajas(int NumId)
        {
            conexion.EjecutaInstruccion("delete from contrarecibo where idcontrarecibo = '" + NumId + "' ");
        }
        public string InsertarDetallesContraRecibo(DetallesContrareciboClass nueva)
        {
            string Mensaje;
            try
            {
                conexion.EjecutaInstruccion($"INSERT INTO detallecontrarecibo (contrarecibo, nota, total, pagada, extra)" +
                    $" VALUES ('{nueva.contrarecibo}', '{nueva.nota}', '{nueva.total}', '{nueva.pagada}', '{nueva.extra}');");
                return Mensaje = "Detalles Contrarecibo registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Detalles Contrarecibo: {ex.Message}";
            }
        }
        //segunda concatenacion
        public string[] Folionotas()
        {
            return conexion.EjecutaSqlResultados("select concat(n.numeronota,' ',p.RazonSocial,' ', n.fecha) as datos\r\nfrom notacompra n \r\ninner join proveedormaterial p on p.idproveedor = n.Proveedor;\r\n");
        }
        public int DevuelveIDObraXNombre(string nombreObra)
        {
            return Convert.ToInt32(conexion.ObtenerUnicoResultado($"select idObra from obra where NombreObra = '{nombreObra}'"));
        }
        // primera  concatenacion 
        public string[] NombresObras()
        {
            return conexion.EjecutaSqlResultados("select concat(o.NombreObra,'',c.fecha)\r\n                from contrarecibo c \r\n                inner join obra o on o.idObra = c.obra;");
        }
        public string obtenerIdNotaCompraXNotafolio(int folio)
        {
            return conexion.ObtenerUnicoResultado($"select idnotacompra from notacompra where numeronota='{folio}'");
        }
        public string obtenerIdDetallesNotaXIdNotaCompra(int idNotaCompra)
        {
            return conexion.ObtenerUnicoResultado($"select iddetallenota from detallenota where nota = '{idNotaCompra}'");
        }
        public int DevuelveIDContraReciboXIdobra(int idobra)
        {
            return Convert.ToInt32(conexion.ObtenerUnicoResultado($"select idcontrarecibo from contrarecibo where obra = '{idobra}'"));
        }


    }
}
