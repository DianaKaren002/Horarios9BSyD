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
    public partial class Docente : System.Web.UI.Page
    {
        DocentesGestion doc = new DocentesGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDocentes.DataSource = doc.MostrarDocentes();
            GridDocentes.DataBind();

            if (!this.IsPostBack)
            {
                DropListDocentes.Items.Clear();
                foreach (string cad in doc.NombresDocentes())
                    DropListDocentes.Items.Add(cad);
            }
            else
            {
                DropListDocentes.Items.Clear();
                foreach (string cad in doc.NombresDocentes())
                    DropListDocentes.Items.Add(cad);
            }
        }

        protected void GridDocentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridDocentes.SelectedIndex;
            int NumId = Convert.ToInt32(GridDocentes.Rows[NumRenglon].Cells[0].Text);
            doc.Bajas(NumId);
            GridDocentes.DataSource = doc.MostrarDocentes();
            GridDocentes.DataBind();
        }

        protected void btnRegistrarDocente_Click(object sender, EventArgs e)
        {
            Docentes Nueva = new Docentes
            {
                Nombre = txtNomDocente.Text,
                A_Paterno = txtA_Pat.Text,
                A_Materno = txtA_Mat.Text,
                Extra = txtExtra.Text
            };

            lbRespuesta.Text = doc.InsertarDocente(Nueva);
            GridDocentes.DataSource = doc.MostrarDocentes();
            GridDocentes.DataBind();
            
        }

        protected void DropListDocentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Nombre = DropListDocentes.SelectedValue;
            Docentes regreso = doc.ObtenerDocentePorNombre(Nombre);

            if (regreso != null)
            {
                txtEditNombre.Text = regreso.Nombre;
                txtEditA_pat.Text = regreso.A_Paterno;
                txtEditA_mat.Text = regreso.A_Materno;
                txtEditExtra.Text = regreso.Extra;
            }
            else
            {
                txtEditNombre.Text = "";
                txtEditA_pat.Text = "";
                txtEditA_mat.Text = "";
                txtEditExtra.Text = "";
            }
            
        }

        protected void btnEditarDocente_Click(object sender, EventArgs e)
        {
            Docentes Nueva = new Docentes
            {
                Nombre = txtEditNombre.Text,
                A_Paterno = txtEditA_pat.Text,
                A_Materno = txtEditA_mat.Text,
                Extra = txtEditExtra.Text
            };
            string Viejo = DropListDocentes.SelectedValue;
            doc.EditarDocente(Nueva, Viejo);

            DropListDocentes.Items.Clear();
            foreach (string cad in doc.NombresDocentes())
                DropListDocentes.Items.Add(cad);

            GridDocentes.DataSource = doc.MostrarDocentes();
            GridDocentes.DataBind();
        }
    }
}