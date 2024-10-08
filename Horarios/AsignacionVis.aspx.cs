﻿using ClassEntities;
using ClassMetodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class AsignacionVis : System.Web.UI.Page
    {
        AsignacionCuatriGestion acua = new AsignacionCuatriGestion();
        DocentesGestion docs = new DocentesGestion();
        AsignaturasGestion asigna = new AsignaturasGestion();
        GruposGestion gru = new GruposGestion();
        PeriodosGestion peri = new PeriodosGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAsignaciones.DataSource = acua.MostrarAsignaciones();
            GridAsignaciones.DataBind();

            if (!this.IsPostBack)
            {
                DropListAsignacionXID.Items.Clear();
                foreach (int id in acua.IdsAsignacion())
                {
                    DropListAsignacionXID.Items.Add(id.ToString());
                }

                DropListGrupoID.Items.Clear();
                foreach (string cad in gru.NombresGrupos())
                    DropListGrupoID.Items.Add(cad);

                DropListEditGrupoID.Items.Clear();
                foreach (string cad in gru.NombresGrupos())
                    DropListEditGrupoID.Items.Add(cad);

                DropListDocenteID.Items.Clear();
                foreach (string cad in docs.NombresDocentes())
                    DropListDocenteID.Items.Add(cad);

                DropDownDocenteID2.Items.Clear();
                foreach (string cad in docs.NombresDocentes())
                    DropDownDocenteID2.Items.Add(cad);

                DropListEditDocenteID.Items.Clear();
                foreach (string cad in docs.NombresDocentes())
                    DropListEditDocenteID.Items.Add(cad);

                DropListAsignaturaID.Items.Clear();
                foreach (string cad in asigna.NombresAsignaturas())
                    DropListAsignaturaID.Items.Add(cad);

                DropListEditAsignaturaID.Items.Clear();
                foreach (string cad in asigna.NombresAsignaturas())
                    DropListEditAsignaturaID.Items.Add(cad);

                //DropListPeriInicio.Items.Clear();
                //foreach (string cad in peri.PeriodoInicio())
                //    DropListPeriInicio.Items.Add(cad);

                //DropListPeriFin.Items.Clear();
                //foreach (string cad in peri.PeriodoFin())
                //    DropListPeriFin.Items.Add(cad);
            }
        }

        protected void GridAsignaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridAsignaciones.SelectedIndex;
            int NumId = Convert.ToInt32(GridAsignaciones.Rows[NumRenglon].Cells[0].Text);
            gru.Bajas(NumId);
            GridAsignaciones.DataSource = acua.MostrarAsignaciones();
            GridAsignaciones.DataBind();
        }

        protected void btnRegistrarAsignacion_Click(object sender, EventArgs e)
        {
            string nombreCompleto = DropListDocenteID.SelectedValue;
            string[] partes = nombreCompleto.Split(' ');
            string nombre = partes[0];

            int grupId = Convert.ToInt32(DropListGrupoID.SelectedIndex.ToString());
            int dId = Convert.ToInt32(docs.IdXNombre(nombre));
            int ASigID = Convert.ToInt32(asigna.DevuelveIDAsignatura(DropListAsignaturaID.SelectedValue));
            int grupoId1 = grupId + 1;
            int DocAP = dId ;
            AsignacionCuatrimestral Nueva = new AsignacionCuatrimestral
            {
                GrupoID = grupoId1,
                DocenteID = dId,
                AsignaturaId = ASigID
            };

            lbRespuesta.Text = acua.InsertarAsignacion(Nueva);
            GridAsignaciones.DataSource = acua.MostrarAsignaciones();
            GridAsignaciones.DataBind();
        }

        protected void btnEditarAsignacion_Click(object sender, EventArgs e)
        {
            int grupId = Convert.ToInt32(gru.DevuelveIDGrupo(DropListEditGrupoID.SelectedValue));
            int dId = Convert.ToInt32(docs.DevuelveIDDocente(DropListEditDocenteID.SelectedValue));
            int ASigID = Convert.ToInt32(asigna.DevuelveIDAsignatura(DropListEditAsignaturaID.SelectedValue));
            AsignacionCuatrimestral Nueva = new AsignacionCuatrimestral
            {
                GrupoID = grupId,
                DocenteID = dId,
                AsignaturaId = ASigID
            };
            int Viejo = Convert.ToInt32(DropListAsignacionXID.SelectedValue);
            acua.EditarAsignacionXid(Nueva, Viejo);

            DropListAsignacionXID.Items.Clear();
            foreach (int id in acua.IdsAsignacion())
            {
                DropListAsignacionXID.Items.Add(id.ToString());
            }

            GridAsignaciones.DataSource = acua.MostrarAsignaciones();
            GridAsignaciones.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            
            
        }

        protected void btnMostrarProfesorXRangoPeriodo_Click(object sender, EventArgs e)
        {
            string nombreCompleto = DropDownDocenteID2.SelectedValue;
            string[] partes = nombreCompleto.Split(' ');
            string nombre = partes[0];
            int IdDoc = Convert.ToInt32(docs.IdXNombre(nombre));
            string PeriIni = DropListPeriInicio.SelectedValue.Trim();
            string PeriFin =DropListPeriFin.SelectedValue.Trim();
            string periodo = $"{PeriIni} - {PeriFin}";
            Label1.Text = $"Docente :{IdDoc} {PeriIni}  {PeriFin}";
            
            GridAsignaciones.DataSource = acua.MostrarXPeriodoYProfesor(periodo, IdDoc);
            GridAsignaciones.DataBind();
        }
    }
}