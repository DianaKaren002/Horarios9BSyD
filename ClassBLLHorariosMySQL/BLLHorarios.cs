using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using ClassDALMySql;

namespace ClassBLLHorariosMySQL
{
    public class BLLHorarios
    {
        private string cad = "";
        private MySqlConnection Conexion;
        private DALMySQL objdal = null;

        public BLLHorarios(string cadeconex)
        {
            cad = cadeconex;
            objdal = new DALMySQL(cad);
        }

        public string probarConexion()
        {
            string mensaje = "";
            objdal.abrirConexion(ref mensaje);
            return mensaje;
        }

        public DataSet ConsultaTabla(string insSql)
        {
            DataSet contenedor = new DataSet();
            try
            {
                Conexion = new MySqlConnection(cad);
                MySqlDataAdapter DA = new MySqlDataAdapter(insSql, Conexion);
                DA.Fill(contenedor);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al consultar la tabla: " + ex.Message);
            }
            finally
            {
                if (Conexion != null && Conexion.State == ConnectionState.Open)
                {
                    Conexion.Close();
                    Conexion.Dispose();
                }
            }
            return contenedor;
        }
        public void EjecutaInstruccion(string instruccionSql)
        {
            try
            {
                Conexion = new MySqlConnection(cad);
                MySqlCommand Comando = new MySqlCommand();
                Comando.Connection = Conexion;
                Comando.CommandText = instruccionSql;

                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al ejecutar la instrucción SQL: " + ex.Message);
            }
            finally
            {
                if (Conexion != null && Conexion.State == ConnectionState.Open)
                {
                    Conexion.Close();
                    Conexion.Dispose();
                }
            }
        }
    }
}
