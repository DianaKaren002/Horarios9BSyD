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
        public DataTable MostrarAsignacionesXPeriodoYProfesor(int IdIni, int IdFin, int IdDocente)
        {
            DataTable resultTable = new DataTable();
            string instSql =
                "SELECT asig.IdAsignacion, g.Cuatrimestre, g.NomGrupo, g.Turno, " +
                "p.NombrePeriodo, p.Año, asig.DocenteID, d.Nombre, d.A_Paterno, d.A_Materno, " +
                "mat.NomAsignatura, p.P_inicio, p.P_Fin " +
                "FROM grupos as g " +
                "INNER JOIN periodos as p ON g.PeriodoID = p.idPeriodo " +
                "INNER JOIN asignacioncuatrimestral as asig ON g.Idgrupo = asig.GrupoID " +
                "INNER JOIN docentes as d ON asig.DocenteID = d.idDocente " +
                "INNER JOIN asignaturas as mat ON asig.AsignaturaID = mat.idasignatura " +
                "WHERE p.P_inicio BETWEEN (SELECT P_inicio FROM periodos WHERE idPeriodo = @perini) " +
                "AND (SELECT P_inicio FROM periodos WHERE idPeriodo = @perfin) " +
                "AND asig.DocenteID = @idprof";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(Conexion))
                {
                    connection.Open();

                    using (MySqlCommand command = new MySqlCommand(instSql, connection))
                    {
                        command.Parameters.AddWithValue("@perini", IdIni);
                        command.Parameters.AddWithValue("@perfin", IdFin);
                        command.Parameters.AddWithValue("@idprof", IdDocente);

                        using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                        {
                            adapter.Fill(resultTable);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                throw new Exception("Error al mostrar Asignación cuatrimestral: " + ex.Message);
            }

            return resultTable;
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
