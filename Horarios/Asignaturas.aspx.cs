using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassMetodos;
using ClassEntities;
using System.Data.SqlClient;

namespace Horarios
{
    public partial class Asignaturas : System.Web.UI.Page
    {
        AsignaturasGestion asig = new AsignaturasGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();

            if (!this.IsPostBack)
            {
                DropListAsignatura.Items.Clear();
                foreach (string cad in asig.NombresAsignaturas())
                    DropListAsignatura.Items.Add(cad);
            }
        }

        protected void GridAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridAsignaturas.SelectedIndex;
            int NumId = Convert.ToInt32(GridAsignaturas.Rows[NumRenglon].Cells[0].Text);
            asig.Bajas(NumId);
            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();
        }

        protected void btnInsertarAsignatura_Click(object sender, EventArgs e)
        {
            Asignatura Nueva = new Asignatura
            {
                NomAsignatura = txtNomAsignatura.Text,
                DescripcionAsig=txtDescripcionAsig.Text,
                HrsxSemana=Convert.ToInt16(txtHoras.Value),
                Cuatrimestre=Convert.ToInt16(txtCuatrimestre.Value)
            };

            lbRespuesta.Text = asig.InsertarAsignatura(Nueva);
            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();
        }

        protected void DropListAsignatura_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnEditarAsig_Click(object sender, EventArgs e)
        {

            Asignatura Nueva = new Asignatura
            {
                NomAsignatura = txtEditNomb.Text,
                DescripcionAsig = txtEditDesc.Text,
                HrsxSemana = Convert.ToInt16(txtEditHora.Value),
                Cuatrimestre = Convert.ToInt16(txtEditCuatri.Value)
            };
            string Viejo = DropListAsignatura.SelectedValue;
            asig.EditarAsignatura(Nueva, Viejo);

            DropListAsignatura.Items.Clear();
            foreach (string cad in asig.NombresAsignaturas())
                DropListAsignatura.Items.Add(cad);

            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Asignatura regreso = asig.ObtenerAsignaturaPorNombre(DropListAsignatura.SelectedValue);

            if (regreso != null)
            {
                txtEditNomb.Text = regreso.NomAsignatura;
                txtEditDesc.Text = regreso.DescripcionAsig;
                txtEditHora.Value = regreso.HrsxSemana.ToString();
                txtEditCuatri.Value = regreso.Cuatrimestre.ToString();
            }
            else
            {
                txtEditNomb.Text = "";
                txtEditDesc.Text = "";
                txtEditHora.Value = "";
                txtEditCuatri.Value = "";
            }
        }
    }
}