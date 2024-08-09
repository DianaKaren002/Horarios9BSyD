using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace ClassDALMySql
{
    public class DALMySQL
    {
        public DALMySQL()
        {
            
        }
        public void abrirConexion(ref string mensaje)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                connection.Open();
            }
        }

        public Boolean ModificarcacionBd(string sentSQL, MySqlConnection cnab, ref string mensaje)
        {
            Boolean salida = false;
            if (cnab != null)
            {
                MySqlCommand carrito = new MySqlCommand();
                carrito.CommandText = sentSQL;
                carrito.Connection = cnab;
                try
                {
                    carrito.ExecuteNonQuery();
                    mensaje = "Modificación Correcta, OK";
                    salida = true;

                }
                catch (Exception ex)
                {
                    salida = false;
                    mensaje = "Error: " + ex.Message;

                }
                cnab.Close();
                cnab.Dispose();
            }
            else
            {
                salida = false;
                mensaje = "No hay conexion con la BD MySQL";
            }
            return salida;
        }


        public MySqlDataReader ConsultarDR(string querySQL, MySqlConnection cnab, ref string mensaje)
        {
            MySqlDataReader repositorio = null;
            if (cnab != null)
            {
                MySqlCommand carrito = new MySqlCommand();
                carrito.CommandText = querySQL;
                carrito.Connection = cnab;
                try
                {
                    repositorio = carrito.ExecuteReader();
                    mensaje = "Consulta Correcta, OK";


                }
                catch (Exception ex)
                {

                    mensaje = "Error: " + ex.Message;

                }
                cnab.Close();
                cnab.Dispose();
            }
            else
            {
                repositorio = null;
                mensaje = "Nohay conecion con la BD MySQL";
            }
            return repositorio;

        }

    }
}
