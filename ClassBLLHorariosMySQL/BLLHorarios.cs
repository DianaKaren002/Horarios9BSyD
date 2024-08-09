using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using ClassDALMySql;

namespace ClassBLLHorariosMySQL
{
    public class BLLHorarios
    {
        private string Conexion;
        private DALMySQL objdal = new DALMySQL();

        public BLLHorarios()
        {
            Conexion = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        }

        public string ProbarConexion()
        {
            string mensaje = "";
            objdal.abrirConexion(ref mensaje);
            return mensaje;
        }

        public DataSet ConsultaTabla(string insSql)
        {
            DataSet contenedor = new DataSet();
            using (MySqlConnection connection = new MySqlConnection(Conexion))
            {
                connection.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter(insSql, connection);
                adapter.Fill(contenedor);
            }
            return contenedor;
        }

        public void EjecutaInstruccion(string instruccionSql)
        {
            using (MySqlConnection connection = new MySqlConnection(Conexion))
            {
                connection.Open();
                MySqlCommand command = new MySqlCommand(instruccionSql, connection);
                command.ExecuteNonQuery();
            }
        }

        public string[] EjecutaSqlResultados(string instruccionSql)
        {
            List<string> resultados = new List<string>();
            using (MySqlConnection connection = new MySqlConnection(Conexion))
            {
                MySqlCommand command = new MySqlCommand(instruccionSql, connection);
                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultados.Add(reader.GetString(0));
                    }
                }
            }
            return resultados.ToArray();
        }

        public int[] EjecutaSqlResultadosInt(string instruccionSql)
        {
            List<int> resultados = new List<int>();
            using (MySqlConnection connection = new MySqlConnection(Conexion))
            {
                MySqlCommand command = new MySqlCommand(instruccionSql, connection);
                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultados.Add(reader.GetInt32(0));
                    }
                }
            }
            return resultados.ToArray();
        }

        public string ObtenerUnicoResultado(string instruccionSql)
        {
            string resultado = string.Empty;
            using (MySqlConnection connection = new MySqlConnection(Conexion))
            {
                connection.Open();
                MySqlCommand command = new MySqlCommand(instruccionSql, connection);

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    resultado = result.ToString();
                }
            }
            return resultado;
        }

        public DataSet ConsultaTablaConParametros(string insSql, params MySqlParameter[] parametros)
        {
            DataSet contenedor = new DataSet();
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(Conexion)) // Cambié `cad` a `Conexion`
                {
                    conexion.Open();
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
    }
}
