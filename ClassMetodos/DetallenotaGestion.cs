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
    public class DetallenotaGestion
    {
        private BLLHorarios conexion = new BLLHorarios();
        public DataTable MostrarDetallenota()
        {
            string instSql = "select n.numeronota,p.RazonSocial,p.AgenteVentas, m.NombreMat, m.Marca, d.cantidad,d.PrecioUnitario from detallenota d inner join notacompra n on n.idnotacompra=d.nota inner join material m on m.Idmaterial = d.material inner join proveedormaterial p on p.idproveedor = n.Proveedor;";

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
            conexion.EjecutaInstruccion("delete from detallenota where iddetallenota = '" + NumId + "' ");
        }
        public string InsertarDetallesNota(DetallesNota nueva)
        {
            string Mensaje;
            try
            {
                conexion.EjecutaInstruccion($"INSERT INTO detallenota (nota, material, cantidad,PrecioUnitario, extra)" +
                    $" VALUES ('{nueva.nota}', '{nueva.material}', '{nueva.cantidad}', '{nueva.PrecioUnitario}', '{nueva.extra}');");
                return Mensaje = "Detalles Nota registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Detalles Nota: {ex.Message}";
            }
        }
        //segunda concatenacion
        public string[] Folionotas()
        {
            return conexion.EjecutaSqlResultados("select concat(n.numeronota,' ',p.RazonSocial,' ', n.fecha) as datos from notacompra n inner join proveedormaterial p on p.idproveedor = n.Proveedor;");
        }
        public string[] DevuelveNombreMaterial()
        {
            return conexion.EjecutaSqlResultados($"select NombreMat from material;");
        }
        public string obtenerIdMaterial(string material)
        {
            return conexion.ObtenerUnicoResultado($"select Idmaterial from material where NombreMat = '{material}'");
        }
   
        public string obtenerIdNotaCompraXNotafolio(int folio)
        {
            return conexion.ObtenerUnicoResultado($"select idnotacompra from notacompra where numeronota='{folio}'");
        }
       
    }
}
