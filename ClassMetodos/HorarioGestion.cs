using ClassBLLHorariosMySQL;
using ClassEntities;
using Org.BouncyCastle.Crypto;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public class HorarioGestion
    {
        private BLLHorarios objBLL = new BLLHorarios();

        public DataTable MostrarHorario()
        {
            string instSql = "SELECT h.idHorario, di.NomDia, h.HrInicio, h.HrFinal, asig.idAsignacion,a.NomAsignatura, g.NomGrupo, g.Cuatrimestre, g.Turno, p.NombrePeriodo,p.P_inicio, p.P_Fin, au.NombAula, " +
                          "d.Nombre FROM asignacioncuatrimestral asig INNER JOIN grupos g ON asig.GrupoID = g.Idgrupo INNER JOIN docentes d On d.idDocente = asig.DocenteID "+
                          "INNER JOIN asignaturas a On a.idasignatura = asig.AsignaturaID "+
                          "INNER JOIN periodos p ON p.idPeriodo = g.PeriodoID INNER JOIN horario h ON h.AsignacionID = asig.idAsignacion INNER JOIN diasemana di ON di.iddia = h.DiaID "+
                          "INNER JOIN aulas au ON au.idAula = g.AulaID; ";
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
                throw new Exception("Error al mostrar Horario: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from horario where idHorario = '" + NumId + "' ");
        }
        public string InsertarHorario(Horario nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO horario (AsignacionID, DiaID, HrInicio, HrFinal, AulaID,)" +
                    $" VALUES ('{nueva.AsignacionID}', '{nueva.DiaID}', '{nueva.HrInicio}', '{nueva.HrFinal}', '{nueva.AulaID}');");
                return Mensaje = "Grupo registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Horario: {ex.Message}";
            }
        }
        public void EditarHorario(Horario nueva, int idH)
        {
            objBLL.EjecutaInstruccion($"UPDATE horario set AsignacionID = '{nueva.AsignacionID}', DiaID = '{nueva.DiaID}', HrInicio = '{nueva.HrInicio}'," +
                $" HrFinal = '{nueva.HrFinal}', AulaID = '{nueva.AulaID}' " +
                $"WHERE idHorario = '{idH}'");
        }
        public int[] IdsHorario()
        {
            return objBLL.EjecutaSqlResultadosInt("select idHorario from horario");
        }
        public int DevuelveIDHorario(string IdHorario)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select idHorario from horario where idHorario = '{IdHorario}'"));
        }
        
        public Horario ObtenerHorarioPorID(int id)
        {
            Horario grup = null;
            string instSql = $"SELECT * FROM horario WHERE idHorario = '{id}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    grup = new Horario
                    {
                        idhorario = Convert.ToInt32(row["idhorario"]),
                        AsignacionID = Convert.ToInt32(row["AsignacionID"]),
                        DiaID = Convert.ToInt32(row["DiaID"]),
                        HrInicio = Convert.ToInt32(row["HrInicio"]),
                        HrFinal = Convert.ToInt32(row["HrFinal"]),
                        AulaID = Convert.ToInt32(row["AulaID"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Horario : " + ex.Message);
            }

            return grup;
        }
    }
}
