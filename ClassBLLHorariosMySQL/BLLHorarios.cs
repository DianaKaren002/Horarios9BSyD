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
        public string[] EjecutaSqlResultados(string instruccionsql)
        {
            List<string> resultados = new List<string>();

            try
            {
                Conexion = new MySqlConnection(cad);
                MySqlCommand Comando = new MySqlCommand();
                Comando.Connection = Conexion;
                Comando.CommandText = instruccionsql;

                Conexion.Open();
                using (MySqlDataReader Lector = Comando.ExecuteReader())
                {
                    if (Lector.HasRows)
                    {
                        while (Lector.Read())
                        {
                            resultados.Add(Lector[0].ToString());
                        }
                    }
                }
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

            return resultados.ToArray();
        }
        public string ObtenerUnicoResultado(string instruccionsql)
        {
            string resultado = string.Empty;

            try
            {
                Conexion = new MySqlConnection(cad);
                MySqlCommand Comando = new MySqlCommand();
                Comando.Connection = Conexion;
                Comando.CommandText = instruccionsql;

                Conexion.Open();
                object result = Comando.ExecuteScalar();
                if (result != null)
                {
                    resultado = result.ToString();
                }
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

            return resultado;
        }
        public DataSet ConsultaTablaConParametros(string insSql, params MySqlParameter[] parametros)
        {
            DataSet contenedor = new DataSet();
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cad))
                {
                    MySqlCommand comando = new MySqlCommand(insSql, conexion);
                    comando.Parameters.AddRange(parametros);
                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    da.Fill(contenedor);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al consultar la tabla: " + ex.Message);
            }

            return contenedor;
        }

        public DataSet ConsultaTabla2(string insSql)
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

    }
}
