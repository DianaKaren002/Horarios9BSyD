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
    public partial class GradoEsp : System.Web.UI.Page
    {
        GradoEspGestion grads = new GradoEspGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridGradsEsp.DataSource = grads.MostrarGradosEsp();
            GridGradsEsp.DataBind();

            if (!this.IsPostBack)
            {
                DropListGrados.Items.Clear();
                foreach (string cad in grads.NombresGrados())
                    DropListGrados.Items.Add(cad);
            }
        }

        protected void GridGradsEsp_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridGradsEsp.SelectedIndex;
            int NumId = Convert.ToInt32(GridGradsEsp.Rows[NumRenglon].Cells[0].Text);
            grads.Bajas(NumId);
            GridGradsEsp.DataSource = grads.MostrarGradosEsp();
            GridGradsEsp.DataBind();
        }

        protected void btnRegistrarGrado_Click(object sender, EventArgs e)
        {
            GradosEspecialidad Nueva = new GradosEspecialidad
            {
                grado = txtNomgrado.Text,
                Extra = txtExtra.Text
            };

            lbRespuesta.Text = grads.InsertarGradosEspecialidad(Nueva);
            GridGradsEsp.DataSource = grads.MostrarGradosEsp();
            GridGradsEsp.DataBind();
        }

        protected void btnEditarGrado_Click(object sender, EventArgs e)
        {
            GradosEspecialidad Nueva = new GradosEspecialidad
            {
                grado = txtEditNombGrado.Text,
                Extra = txtEditExtra.Text
            };
            string Viejo = DropListGrados.SelectedValue;
            grads.EditarGradoEsp(Nueva, Viejo);

            DropListGrados.Items.Clear();
            foreach (string cad in grads.NombresGrados())
                DropListGrados.Items.Add(cad);

            GridGradsEsp.DataSource = grads.MostrarGradosEsp();
            GridGradsEsp.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            GradosEspecialidad regreso = grads.ObtenerGradosPorNombre(DropListGrados.SelectedValue);

            if (regreso != null)
            {
                txtEditNombGrado.Text = regreso.grado;
                txtEditExtra.Text = regreso.Extra;
            }
            else
            {
                txtEditNombGrado.Text = "";
                txtEditExtra.Text = "";
            }
        }
    }
}