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
    public partial class Especialidad : System.Web.UI.Page
    {
        DivisionGestion divs = new DivisionGestion();
        GradoEspGestion grads = new GradoEspGestion();
        EspecialidadesGestion esp = new EspecialidadesGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridEspecialidades.DataSource = esp.MostrarEspecialidades();
            GridEspecialidades.DataBind();

            if (!this.IsPostBack)
            {
                DropListEspecialidad.Items.Clear();
                foreach (string cad in esp.NombresEspecialidad())
                    DropListEspecialidad.Items.Add(cad);

                DropListDivisionId.Items.Clear();
                foreach (string cad in divs.NombresDivisiones())
                    DropListDivisionId.Items.Add(cad);

                DropListEditDivisionId.Items.Clear();
                foreach (string cad in divs.NombresDivisiones())
                    DropListEditDivisionId.Items.Add(cad);

                DropListGradoEspId.Items.Clear();
                foreach (string cad in grads.NombresGrados())
                    DropListGradoEspId.Items.Add(cad);

                DropListEditGradoEspId.Items.Clear();
                foreach (string cad in grads.NombresGrados())
                    DropListEditGradoEspId.Items.Add(cad);
            }
            
        }

        protected void GridEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridEspecialidades.SelectedIndex;
            int NumId = Convert.ToInt32(GridEspecialidades.Rows[NumRenglon].Cells[0].Text);
            esp.Bajas(NumId);
            GridEspecialidades.DataSource = esp.MostrarEspecialidades();
            GridEspecialidades.DataBind();
        }

        protected void btnRegistrarEsp_Click(object sender, EventArgs e)
        {
            int DivId = Convert.ToInt32(divs.IdDivisiones(DropListDivisionId.SelectedValue));
            int gradoId = Convert.ToInt32(grads.IdGrados(DropListGradoEspId.SelectedValue));
            Especialidades Nueva = new Especialidades
            {
                NombreEsp = txtNomEsp.Text,
                DescripcionEsp = txtDescripEsp.Text,
                DivisionID = DivId,
                gradoEspecialidad = gradoId
            };

            lbRespuesta.Text = esp.InsertarEspecialidad(Nueva);
            GridEspecialidades.DataSource = esp.MostrarEspecialidades();
            GridEspecialidades.DataBind();
        }

        protected void btnEditarEsp_Click(object sender, EventArgs e)
        {
            int DivId = Convert.ToInt32(divs.IdDivisiones(DropListEditDivisionId.SelectedValue));
            int gradoId = Convert.ToInt32(grads.IdGrados(DropListEditGradoEspId.SelectedValue));
            Especialidades Nueva = new Especialidades
            {
                NombreEsp = txtEditNombreEsp.Text,
                DescripcionEsp = txtEditDescripcionEsp.Text,
                DivisionID = DivId,
                gradoEspecialidad = gradoId
            };
            string Viejo = DropListEspecialidad.SelectedValue;
            esp.EditarEpecialidad(Nueva, Viejo);

            DropListEspecialidad.Items.Clear();
            foreach (string cad in esp.NombresEspecialidad())
                DropListEspecialidad.Items.Add(cad);

            GridEspecialidades.DataSource = esp.MostrarEspecialidades();
            GridEspecialidades.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Especialidades regreso = esp.ObtenerespecialidadPorNombre(DropListEspecialidad.SelectedValue);

            if (regreso != null)
            {
                txtEditNombreEsp.Text = regreso.NombreEsp;
                txtEditDescripcionEsp.Text = regreso.DescripcionEsp;
                lbDivision.Text = divs.ObtenerNombreXid(regreso.DivisionID).ToString();
                lbGradoIdNom.Text = grads.ObtenerNombreGradoXid(regreso.gradoEspecialidad).ToString();
            }
            else
            {
                txtEditNombreEsp.Text = "";
                txtEditDescripcionEsp.Text = "";
                lbDivision.Text = "";
                lbGradoIdNom.Text = "";
            }
        }
    }
}