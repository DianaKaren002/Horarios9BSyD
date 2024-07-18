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
    public partial class Division : System.Web.UI.Page
    {
        DivisionGestion divs = new DivisionGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDivisiones.DataSource = divs.MostrarDivisiones();
            GridDivisiones.DataBind();

            if (!this.IsPostBack)
            {
                DropListDivision.Items.Clear();
                foreach (string cad in divs.NombresDivisiones())
                    DropListDivision.Items.Add(cad);
            }
        }

        protected void GridDivisiones_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridDivisiones.SelectedIndex;
            int NumId = Convert.ToInt32(GridDivisiones.Rows[NumRenglon].Cells[0].Text);
            divs.Bajas(NumId);
            GridDivisiones.DataSource = divs.MostrarDivisiones();
            GridDivisiones.DataBind();
        }

        protected void btnRegistrarDiv_Click(object sender, EventArgs e)
        {
            Divisiones Nueva = new Divisiones
            {
                NombreDivision = txtNomDiv.Text,
                DescripcionDiv = txtDescripcion.Text
            };

            lbRespuesta.Text = divs.InsertarDivision(Nueva);
            GridDivisiones.DataSource = divs.MostrarDivisiones();
            GridDivisiones.DataBind();
        }

        protected void DropListDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Nombre = DropListDivision.SelectedValue;
            
        }

        protected void btnEditarDiv_Click(object sender, EventArgs e)
        {
            Divisiones Nueva = new Divisiones
            {
                NombreDivision = txtEditNombreDiv.Text,
                DescripcionDiv = txtEditDescripcion.Text
            };
            string Viejo = DropListDivision.SelectedValue;
            divs.EditarDivision(Nueva, Viejo);

            DropListDivision.Items.Clear();
            foreach (string cad in divs.NombresDivisiones())
                DropListDivision.Items.Add(cad);

            GridDivisiones.DataSource = divs.MostrarDivisiones();
            GridDivisiones.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Divisiones regreso = divs.ObtenerDivisionesPorNombre(DropListDivision.SelectedValue);

            if (regreso != null)
            {
                txtEditNombreDiv.Text = regreso.NombreDivision;
                txtEditDescripcion.Text = regreso.DescripcionDiv;
            }
            else
            {
                txtEditNombreDiv.Text = "";
                txtEditDescripcion.Text = "";
            }
        }
    }
}