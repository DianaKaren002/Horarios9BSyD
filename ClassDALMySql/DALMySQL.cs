using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace ClassDALMySql
{
    public class DALMySQL
    {
        public string cadconex { get; set; }
        public DALMySQL(string cadenaCon)
        {
            cadconex = cadenaCon;
        }
        public MySqlConnection abrirConexion(ref string mensaje)
        {
            MySqlConnection cn1 = new MySqlConnection();
            cn1.ConnectionString = cadconex;
            try
            {
                cn1.Open();
                mensaje = "Conexión Abierta";

            }
            catch (Exception ex)
            {
                cn1 = null;
                mensaje = "Error: " + ex.Message;
            }
            return cn1;
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
