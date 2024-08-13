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
            string instSql = "SELECT asig.idAsignacion, g.Cuatrimestre, g.NomGrupo, g.Turno, p.NombrePeriodo, p.Año, asig.DocenteID, d.Nombre, d.A_Paterno, d.A_Materno, a.NomAsignatura, p.P_inicio, p.P_Fin " +
                 "FROM asignacioncuatrimestral asig " +
                 "INNER JOIN grupos g ON asig.GrupoID = g.Idgrupo " +
                 "INNER JOIN docentes d ON d.idDocente = asig.DocenteID " +
                 "INNER JOIN asignaturas a ON a.idasignatura = asig.AsignaturaID " +
                 "INNER JOIN periodos p ON p.idPeriodo = g.PeriodoID " +
                 "INNER JOIN aulas au ON au.idAula = g.AulaID;";
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

        public DataTable MostrarAsignacionesXPeriodoYProfesor(int IdIni, int IdFin, int IdDocente)
        {
            string instSql = $"set @perini={IdIni};" +
                $"set @perfin={IdFin};" +
                $"set @idprof={IdDocente};" +
                "select @fechaini:=P_inicio" +
                "From periodos where idPeriodo=@perini;" +
                "select @fechafin:=P_inicio " +
                "From periodos where idPeriodo=@perfin;" +
                "select asig.IdAsignacion, g.Cuatrimestre,g.NomGrupo, g.Turno," +
                "p.NombrePeriodo , p.Año, asig.DocenteID,d.Nombre, d.A_Paterno,d.A_Materno," +
                "mat.NomAsignaturap.P_inicio,p.P_Fin from grupos as g inner join periodos as p on g.PeriodoID=p.idPeriodo " +
                "inner join asignacioncuatrimestral as asig on g.Idgrupo=asig.GrupoID inner join docentes as d on asig.DocenteID=d.idDocente " +
                "inner join asignaturas as mat on asig.AsignaturaID=mat.idasignatura where (p.P_inicio between @fechaini and @fechafin) and asig.DocenteID=@idprof;";
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
        public DataTable MostrarXPeriodoYProfesor(string perin, int IdDocente)
        {
            return conexion.MostrarAsignacionesXPeriodoYProfesor(perin, IdDocente);
        }
    }
}
