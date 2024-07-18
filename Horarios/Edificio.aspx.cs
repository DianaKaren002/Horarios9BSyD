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
    public partial class Edificio : System.Web.UI.Page
    {
        DivisionGestion divs = new DivisionGestion();
        EdificiosGestion edif = new EdificiosGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridEdificios.DataSource = edif.MostrarEdificios();
            GridEdificios.DataBind();

            if (!this.IsPostBack)
            {
                DropListEdificio.Items.Clear();
                foreach (string cad in edif.NombresEdificios())
                    DropListEdificio.Items.Add(cad);
            }
            if (!this.IsPostBack)
            {
                DropListDivisionId.Items.Clear();
                foreach (string cad in divs.NombresDivisiones())
                    DropListDivisionId.Items.Add(cad);
            }
            if (!this.IsPostBack)
            {
                DropListEditDivisionId.Items.Clear();
                foreach (string cad in divs.NombresDivisiones())
                    DropListEditDivisionId.Items.Add(cad);
            }
        }

        protected void GridEdificios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridEdificios.SelectedIndex;
            int NumId = Convert.ToInt32(GridEdificios.Rows[NumRenglon].Cells[0].Text);
            edif.Bajas(NumId);
            GridEdificios.DataSource = edif.MostrarEdificios();
            GridEdificios.DataBind();
        }

        protected void btnRegistrarEdificio_Click(object sender, EventArgs e)
        {
            int DivId = Convert.ToInt32(divs.IdDivisiones(DropListDivisionId.SelectedValue));
            Edificios Nueva = new Edificios
            {
                NombreEdificio = txtNomEdif.Text,
                DescripcionEdif = txtDescripEdif.Text,
                DivisionId=DivId
            };

            lbRespuesta.Text = edif.Insertaredificio(Nueva);
            GridEdificios.DataSource = edif.MostrarEdificios();
            GridEdificios.DataBind();
        }

        protected void btnEditarEdif_Click(object sender, EventArgs e)
        {
            int DivId = Convert.ToInt32(divs.IdDivisiones(DropListEditDivisionId.SelectedValue));
            Edificios Nueva = new Edificios
            {
                NombreEdificio = txtEditNombreEdif.Text,
                DescripcionEdif = txtEditDescripcion.Text,
                DivisionId = DivId
            };
            string Viejo = DropListEdificio.SelectedValue;
            edif.EditarEdificios(Nueva, Viejo);

            DropListEdificio.Items.Clear();
            foreach (string cad in divs.NombresDivisiones())
                DropListEdificio.Items.Add(cad);

            GridEdificios.DataSource = edif.MostrarEdificios();
            GridEdificios.DataBind();
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Edificios regreso = edif.ObteneredificiosPorNombre(DropListEdificio.SelectedValue);

            if (regreso != null)
            {
                txtEditNombreEdif.Text = regreso.NombreEdificio;
                txtEditDescripcion.Text = regreso.DescripcionEdif;
                lbDivision.Text = divs.ObtenerNombreXid(regreso.DivisionId).ToString();
            }
            else
            {
                txtEditNombreEdif.Text = "";
                txtEditDescripcion.Text = "";
                lbDivision.Text = "";
            }
        }
    }
}