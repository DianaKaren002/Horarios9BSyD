using ClassBLLHorariosMySQL;
using ClassDALMySql;
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
    public class AsignacionCuatriGestion
    { 
        private BLLHorarios conexion = new BLLHorarios();

        public DataTable MostrarAsignaciones()
        {
            string instSql = "SELECT asig.idAsignacion, g.NomGrupo, g.Cuatrimestre, g.Turno, p.NombrePeriodo, au.NombAula, d.Nombre " +
                   "FROM asignacioncuatrimestral asig INNER JOIN grupos g ON asig.GrupoID = g.Idgrupo INNER JOIN docentes d On d.idDocente = asig.DocenteID " +
                   "INNER JOIN asignaturas a On a.idasignatura = asig.AsignaturaID INNER JOIN periodos p ON p.idPeriodo = g.PeriodoID " +
                   "INNER JOIN aulas au ON au.idAula = g.AulaID; ";
            DataTable resultTable = null;

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
                throw new Exception("Error al mostrar Asignacion cuatrimestral: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            conexion.EjecutaInstruccion("delete from asignacioncuatrimestral where idAsignacion = '" + NumId + "' ");
        }
        public string InsertarAsignacion(AsignacionCuatrimestral nueva)
        {
            string Mensaje;
            try
            {
                conexion.EjecutaInstruccion($"INSERT INTO asignacioncuatrimestral (GrupoID, DocenteID, AsignaturaID)" +
                    $" VALUES ('{nueva.GrupoID}', '{nueva.DocenteID}', '{nueva.AsignaturaId}');");
                return Mensaje = "Asignacion registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Asignacion: {ex.Message}";
            }
        }
        public void EditarAsignacionXid(AsignacionCuatrimestral nueva, int idOld)
        {
            conexion.EjecutaInstruccion($"UPDATE asignacioncuatrimestral set GrupoID = '{nueva.GrupoID}', DocenteID = '{nueva.DocenteID}', AsignaturaID = '{nueva.AsignaturaId}'," +
                $" WHERE idAsignacion = '{idOld}'");
        }
        public int[] IdsAsignacion()
        {
            return conexion.EjecutaSqlResultadosInt("select idAsignacion from asignacioncuatrimestral");
        }
        public int DevuelveIDAsignacion(int idAsig)
        {
            return Convert.ToInt32(conexion.ObtenerUnicoResultado($"select idAsignacion from asignacioncuatrimestral where idAsignacion = '{idAsig}'"));
        }
        
        public AsignacionCuatrimestral ObtenerAsignacionXid(string id)
        {
            AsignacionCuatrimestral asigna = null;
            string instSql = $"SELECT * FROM asignacioncuatrimestral WHERE idAsignacion = '{id}'";

            try
            {
                DataSet ds = conexion.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    asigna = new AsignacionCuatrimestral
                    {
                        idAsignacion= Convert.ToInt32(row["idAsignacion"]),
                        GrupoID = Convert.ToInt32(row["GrupoID"]),
                        DocenteID = Convert.ToInt32(row["DocenteID"]),
                        AsignaturaId = Convert.ToInt32(row["AsignaturaID"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Asignacion : " + ex.Message);
            }

            return asigna;
        }
    }
}
