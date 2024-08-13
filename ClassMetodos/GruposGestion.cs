using ClassBLLHorariosMySQL;
using ClassEntities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassMetodos
{
    public  class GruposGestion
    {
        private BLLHorarios objBLL = new BLLHorarios();

        public DataTable MostrarGrupos()
        {
            string instSql = "SELECT g.Idgrupo, g.NomGrupo, g.Cuatrimestre, g.Turno, p.NombrePeriodo, a.NombAula, d.nombre AS NombreDocente, e.NombreEsp FROM grupos g INNER JOIN" +
                " periodos p ON g.PeriodoID = p.idPeriodo INNER JOIN aulas a ON g.AulaID = a.idAula  INNER JOIN docentes d ON g.TutorID = d.idDocente " +
                "INNER JOIN especialidades e ON g.EspecialidadID = e.idEspecialidad;";
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
                throw new Exception("Error al mostrar Grupos: " + ex.Message);
            }

            return resultTable;
        }
        public void Bajas(int NumId)
        {
            objBLL.EjecutaInstruccion("delete from asignacioncuatrimestral where idAsignacion = '" + NumId + "' ");
        }
        public string InsertarGrupo(Grupos nueva)
        {
            string Mensaje;
            try
            {
                objBLL.EjecutaInstruccion($"INSERT INTO grupos (NomGrupo, Cuatrimestre, Turno, PeriodoID, AulaID,TutorID, EspecialidadID)" +
                    $" VALUES ('{nueva.NomGrupo}', '{nueva.Cuatrimestre}', '{nueva.Turno}', '{nueva.PeriodoID}', '{nueva.AulaID}', '{nueva.TutorID}', '{nueva.EspecialidadID}');");
                return Mensaje = "Grupo registrado correctamente.";
            }
            catch (Exception ex)
            {
                return Mensaje = $"Error al registrar Grupo: {ex.Message}";
            }
        }
        public void EditarGrupo(Grupos nueva, string NombreViejo)
        {
            objBLL.EjecutaInstruccion($"UPDATE grupos set NomGrupo = '{nueva.NomGrupo}', Cuatrimestre = '{nueva.Cuatrimestre}', Turno = '{nueva.Turno}'," +
                $" PeriodoID = '{nueva.PeriodoID}', AulaID = '{nueva.AulaID}', TutorID = '{nueva.TutorID}', EspecialidadID = '{nueva.EspecialidadID}'  " +
                $"WHERE NomGrupo = '{NombreViejo}'");
        }
        public string[] NombresGrupos()
        {
            return objBLL.EjecutaSqlResultados("select concat(Cuatrimestre, '', NomGrupo) as datos from grupos;");
        }
        public string[] Cuatrimestre()
        {
            return objBLL.EjecutaSqlResultados("select Cuatrimestre from grupos");
        }
        public int DevuelveIDGrupo(string NomGrup)
        {
            return Convert.ToInt32(objBLL.ObtenerUnicoResultado($"select Idgrupo from grupos where NomGrupo = '{NomGrup}'"));
        }
        public string ObtenerNombreGrupoXid(int id)
        {
            return objBLL.ObtenerUnicoResultado($"select NomGrupo from grupos where Idgrupo = '{id}'");
        }
        public Grupos ObtenerGrupoPorNombre(string nombreGrup)
        {
            Grupos grup = null;
            string instSql = $"SELECT * FROM grupos WHERE NomGrupo = '{nombreGrup}'";

            try
            {
                DataSet ds = objBLL.ConsultaTabla(instSql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    grup = new Grupos
                    {
                        Idgrupo = Convert.ToInt32(row["Idgrupo"]),
                        NomGrupo = row["NomGrupo"].ToString(),
                        Cuatrimestre = Convert.ToInt32(row["Cuatrimestre"]),
                        Turno = row["Turno"].ToString(),
                        PeriodoID = Convert.ToInt32(row["PeriodoID"]),
                        AulaID = Convert.ToInt32(row["AulaID"]),
                        TutorID = Convert.ToInt32(row["TutorID"]),
                        EspecialidadID = Convert.ToInt32(row["EspecialidadID"])
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener Grupo por nombre: " + ex.Message);
            }

            return grup;
        }
    }
}
