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
    public partial class Periodo : System.Web.UI.Page
    {
        PeriodosGestion per = new PeriodosGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridPeriodos.DataSource = per.MostrarPeriodos();
            GridPeriodos.DataBind();

            if (!this.IsPostBack)
            {
                DropListPeriodos.Items.Clear();
                foreach (string cad in per.NombresPeriodos())
                    DropListPeriodos.Items.Add(cad);
            }
        }

        protected void GridPeriodos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridPeriodos.SelectedIndex;
            int NumId = Convert.ToInt32(GridPeriodos.Rows[NumRenglon].Cells[0].Text);
            per.Bajas(NumId);
            GridPeriodos.DataSource = per.MostrarPeriodos();
            GridPeriodos.DataBind();
        }

        protected void btnRegistrarPeriodo_Click(object sender, EventArgs e)
        {
            try
            {
                Periodos Nueva = new Periodos
                {
                    NombrePeriodo = txtNomPeriodo.Text,
                    P_inicio = DateTime.ParseExact(txtPeriodoInicio.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture),
                    P_Fin = DateTime.ParseExact(txtPeriodoFin.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture),
                    Año = Convert.ToInt32(txtAño.Text),
                    Extra = txtExtra.Text
                };

                lbRespuesta.Text = per.InsertarPeriodos(Nueva);
                GridPeriodos.DataSource = per.MostrarPeriodos();
                GridPeriodos.DataBind();
                if (!this.IsPostBack)
                {
                    DropListPeriodos.Items.Clear();
                    foreach (string cad in per.NombresPeriodos())
                        DropListPeriodos.Items.Add(cad);
                }
            }
            catch (Exception ex)
            {
                lbRespuesta.Text = "Error al registrar el periodo: " + ex.Message;
            }
        }

        protected void btnEditarPeriodo_Click(object sender, EventArgs e)
        {
            try
            {
                Periodos Nueva = new Periodos
                {
                    NombrePeriodo = txteditNomPe.Text,
                    P_inicio = DateTime.ParseExact(txtEditP_inicio.Text, "yyyy-MM-dd", null),
                    P_Fin = DateTime.ParseExact(txtEditP_fin.Text, "yyyy-MM-dd", null),
                    Año = Convert.ToInt32(txtEditAño.Text),
                    Extra = txtEditExtra.Text
                };
                string Viejo = DropListPeriodos.SelectedValue;
                per.EditarPeriodo(Nueva, Viejo);

                GridPeriodos.DataSource = per.MostrarPeriodos();
                GridPeriodos.DataBind();

                // Actualizar el DropDownList si es necesario
                DropListPeriodos.Items.Clear();
                foreach (string cad in per.NombresPeriodos())
                    DropListPeriodos.Items.Add(cad);
            }
            catch (FormatException ex)
            {
                lbRespuesta.Text = "Error en el formato de la fecha: " + ex.Message;
            }
            catch (Exception ex)
            {
                lbRespuesta.Text = "Error al editar el periodo: " + ex.Message;
            }
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Periodos regreso = per.ObtenerPeriodosPorNombre(DropListPeriodos.SelectedValue);

            if (regreso != null)
            {
                txteditNomPe.Text = regreso.NombrePeriodo;
                txtEditP_inicio.Text = regreso.P_inicio.ToString("yyyy-MM-dd");
                txtEditP_fin.Text = regreso.P_Fin.ToString("yyyy-MM-dd");
                txtEditAño.Text = regreso.Año.ToString();
                txtEditExtra.Text = regreso.Extra;
            }
            else
            {
                txteditNomPe.Text = "";
                txtEditP_inicio.Text = "";
                txtEditP_fin.Text = "";
                txtEditAño.Text = "";
                txtEditExtra.Text = "";
            }
        }
    }
}