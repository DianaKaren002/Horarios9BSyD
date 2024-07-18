using ClassEntities;
using ClassMetodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class GrupoVis : System.Web.UI.Page
    {
        PeriodosGestion peri = new PeriodosGestion();
        AulasGestion au = new AulasGestion();
        DocentesGestion docs = new DocentesGestion();
        EspecialidadesGestion esp = new EspecialidadesGestion();
        GruposGestion gru = new GruposGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridGrupos.DataSource = gru.MostrarGrupos();
            GridGrupos.DataBind();

            if (!this.IsPostBack)
            {
                DropListGrupos.Items.Clear();
                foreach (string cad in gru.NombresGrupos())
                    DropListGrupos.Items.Add(cad);

                DropListPeriodoId.Items.Clear();
                foreach (string cad in peri.NombresPeriodos())
                    DropListPeriodoId.Items.Add(cad);

                DropListEditPeridoID.Items.Clear();
                foreach (string cad in peri.NombresPeriodos())
                    DropListEditPeridoID.Items.Add(cad);

                DropListAulaID.Items.Clear();
                foreach (string cad in au.NombresAulas())
                    DropListAulaID.Items.Add(cad);

                DropListEditAulaID.Items.Clear();
                foreach (string cad in au.NombresAulas())
                    DropListEditAulaID.Items.Add(cad);

                DropListTutorID.Items.Clear();
                foreach (string cad in docs.NombresDocentes())
                    DropListTutorID.Items.Add(cad);

                DropListEditTutorID.Items.Clear();
                foreach (string cad in docs.NombresDocentes())
                    DropListEditTutorID.Items.Add(cad);

                DropListEspecialidadID.Items.Clear();
                foreach (string cad in esp.NombresEspecialidad())
                    DropListEspecialidadID.Items.Add(cad);

                DropListEditEspID.Items.Clear();
                foreach (string cad in esp.NombresEspecialidad())
                    DropListEditEspID.Items.Add(cad);

            }
          
            
        }

        protected void GridGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridGrupos.SelectedIndex;
            int NumId = Convert.ToInt32(GridGrupos.Rows[NumRenglon].Cells[0].Text);
            gru.Bajas(NumId);
            GridGrupos.DataSource = gru.MostrarGrupos();
            GridGrupos.DataBind();
        }

        protected void btnRegistrarGrupo_Click(object sender, EventArgs e)
        {
            int periId = Convert.ToInt32(peri.IdPeriodos(DropListPeriodoId.SelectedValue));
            int auID = Convert.ToInt32(au.DevuelveIDAula(DropListAulaID.SelectedValue));
            int tuID = Convert.ToInt32(docs.DevuelveIDDocente(DropListTutorID.SelectedValue));
            int EspID = Convert.ToInt32(esp.DevuelveIDEsp(DropListEspecialidadID.SelectedValue));
            Grupos Nueva = new Grupos
            {
                NomGrupo = txtNomGrupo.Text,
                Cuatrimestre = Convert.ToInt16(txtCuatrimestre.Value),
                Turno = DropListTurno.SelectedValue,
                PeriodoID = periId,
                AulaID = auID,
                TutorID = tuID,
                EspecialidadID=EspID
            };

            lbRespuesta.Text = gru.InsertarGrupo(Nueva);
            GridGrupos.DataSource = gru.MostrarGrupos();
            GridGrupos.DataBind();
        }

        protected void btnEditarGrupo_Click(object sender, EventArgs e)
        {
            int periId = Convert.ToInt32(peri.IdPeriodos(DropListEditPeridoID.SelectedValue));
            int auID = Convert.ToInt32(au.DevuelveIDAula(DropListEditAulaID.SelectedValue));
            int tuID = Convert.ToInt32(docs.DevuelveIDDocente(DropListEditTutorID.SelectedValue));
            int EspID = Convert.ToInt32(esp.DevuelveIDEsp(DropListEditEspID.SelectedValue));
            Grupos Nueva = new Grupos
            {
                NomGrupo = txtEditNomGrupo.Text,
                Cuatrimestre = Convert.ToInt16(txtEditCuatri.Value),
                Turno = DropListTurno.SelectedValue,
                PeriodoID = periId,
                AulaID = auID,
                TutorID = tuID,
                EspecialidadID = EspID
            };
            string Viejo = DropListGrupos.SelectedValue;
            gru.EditarGrupo(Nueva, Viejo);

            DropListGrupos.Items.Clear();
            foreach (string cad in gru.NombresGrupos())
                DropListGrupos.Items.Add(cad);

            GridGrupos.DataSource = gru.MostrarGrupos();
            GridGrupos.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Grupos regreso = gru.ObtenerGrupoPorNombre(DropListGrupos.SelectedValue);

            if (regreso != null)
            {
                txtEditNomGrupo.Text = regreso.NomGrupo;
                txtEditCuatri.Value = regreso.Cuatrimestre.ToString();
                lbTurnoEdit.Text = regreso.Turno;
                lbPeriodoEdit.Text = peri.ObtenerNombrePerXid(regreso.PeriodoID);
                lbAulaEdit.Text = au.ObtenerNombreAulaXid(regreso.AulaID);
                lbTutorEdit.Text = docs.ObtenerNombreDocenteXid(regreso.TutorID);
                lbEspecialidadEDit.Text = esp.ObtenerNombreEspecialidadXid(regreso.EspecialidadID);
            }
            else
            {
                txtEditNomGrupo.Text = "";
                txtEditCuatri.Value = "";
                lbTurnoEdit.Text = "";
                lbPeriodoEdit.Text = "";
                lbAulaEdit.Text = "";
                lbTutorEdit.Text = "";
                lbEspecialidadEDit.Text = "";
            }
        }
    }
}