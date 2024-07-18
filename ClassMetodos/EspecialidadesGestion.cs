﻿using ClassBLLHorariosMySQL;
using ClassEntities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public class EspecialidadesGestion
    {
        private BLLHorarios objBLL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");

        public DataTable MostrarEspecialidades()
        {
            string instSql = "SELECT e.idEspecialidad, e.NombreEsp, e.DescripcionEsp, d.NombreDivision, g.grado FROM especialidades e INNER JOIN divisiones d ON e.DivisionID = d.Id_Division " +
                "INNER JOIN gradosespecialidad g ON e.gradoEspecialidad = g.idgradosespecialidad";
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
                throw new Exception("Error al mostrar especialidades: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from especialidades where idEspecialidad = '" + NumId + "' ");
        }
        public string InsertarEspecialidad(Especialidades nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO especialidades (NombreEsp, DescripcionEsp, DivisionID, gradoEspecialidad) VALUES ('{nueva.NombreEsp}', '{nueva.DescripcionEsp}', '{nueva.DivisionID}', '{nueva.gradoEspecialidad}');");
                return Mensaje = "Especialidad registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Especialidad: {ex.Message}";
            }
        }
        public void EditarEpecialidad(Especialidades nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE especialidades set NombreEsp = '{nueva.NombreEsp}', DescripcionEsp = '{nueva.DescripcionEsp}', DivisionID = '{nueva.DivisionID}', gradoEspecialidad = '{nueva.gradoEspecialidad}'  WHERE NombreEsp = '{NombreViejo}'");
        }
        public string[] NombresEspecialidad()
        {
            return objBLL.EjecutaSqlResultados("select NombreEsp from especialidades");
        }
        public Especialidades ObtenerespecialidadPorNombre(string nombreEspecial)
        {
            Especialidades esp = null;
            string instSql = $"SELECT * FROM especialidades WHERE NombreEsp = '{nombreEspecial}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    esp = new Especialidades
                    {
                        idEspecialidad = Convert.ToInt32(row["idEspecialidad"]),
                        NombreEsp = row["NombreEsp"].ToString(),
                        DescripcionEsp = row["DescripcionEsp"].ToString(),
                        DivisionID = Convert.ToInt32(row["DivisionID"]),
                        gradoEspecialidad= Convert.ToInt32(row["gradoEspecialidad"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener especialidad por nombre: " + ex.Message);
            }

            return esp;
        }
    }
}