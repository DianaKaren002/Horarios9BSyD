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
    public partial class Aula : System.Web.UI.Page
    {
        AulasGestion aulas = new AulasGestion();
        EdificiosGestion edif = new EdificiosGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAulas.DataSource = aulas.MostrarAulas();
            GridAulas.DataBind();

            if (!this.IsPostBack)
            {
                DropListAulas.Items.Clear();
                foreach (string cad in aulas.NombresAulas())
                    DropListAulas.Items.Add(cad);

                DropListEdificioId.Items.Clear();
                foreach (string cad in edif.NombresEdificios())
                    DropListEdificioId.Items.Add(cad);

                DropListEditEdificioId.Items.Clear();
                foreach (string cad in edif.NombresEdificios())
                    DropListEditEdificioId.Items.Add(cad);
            }
        }

        protected void GridAulas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridAulas.SelectedIndex;
            int NumId = Convert.ToInt32(GridAulas.Rows[NumRenglon].Cells[0].Text);
            aulas.Bajas(NumId);
            GridAulas.DataSource = aulas.MostrarAulas();
            GridAulas.DataBind();
        }

        protected void btnRegistrarAula_Click(object sender, EventArgs e)
        {
            int EdifId = Convert.ToInt32(edif.IdEdificios(DropListEdificioId.SelectedValue));
            Aulas Nueva = new Aulas
            {
                NombAula = txtNomAula.Text,
                Descripcion = txtDescripAula.Text,
                EdificioID = EdifId
            };

            lbRespuesta.Text = aulas.InsertarAulas(Nueva);
            GridAulas.DataSource = aulas.MostrarAulas();
            GridAulas.DataBind();
        }

        protected void btnEditarAula_Click(object sender, EventArgs e)
        {
            int EdifId = Convert.ToInt32(edif.IdEdificios(DropListEditEdificioId.SelectedValue));
            Aulas Nueva = new Aulas
            {
                NombAula = txtEditNombreAula.Text,
                Descripcion = txtEditDescripcionAu.Text,
                EdificioID = EdifId
            };
            string Viejo = DropListAulas.SelectedValue;
            aulas.EditarAula(Nueva, Viejo);

            DropListAulas.Items.Clear();
            foreach (string cad in aulas.NombresAulas())
                DropListAulas.Items.Add(cad);

            GridAulas.DataSource = aulas.MostrarAulas();
            GridAulas.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Aulas regreso = aulas.ObtenerAulasPorNombre(DropListAulas.SelectedValue);

            if (regreso != null)
            {
                txtEditNombreAula.Text = regreso.NombAula;
                txtEditDescripcionAu.Text = regreso.Descripcion;
                lbnomEdif.Text = edif.ObtenerNombreEdifXid(regreso.EdificioID).ToString();
            }
            else
            {
                txtEditNombreAula.Text = "";
                txtEditDescripcionAu.Text = "";
                lbnomEdif.Text = "";
            }
        }
    }
}