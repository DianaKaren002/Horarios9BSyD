using ClassEntities;
using ClassMetodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class DetallesContraRecibo2 : System.Web.UI.Page
    {
        DetalleContrarGestion det = new DetalleContrarGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDetallesContra.DataSource = det.MostrarDetalleContrar();
            GridDetallesContra.DataBind();

            if (!this.IsPostBack)
            {
                DropListNombreObra.Items.Clear();
                foreach (string Contrareci in det.NombresObras())
                {
                    DropListNombreObra.Items.Add(Contrareci.ToString());
                }

                DropListNota1.Items.Clear();
                foreach (string listaNota in det.Folionotas())
                {
                    DropListNota1.Items.Add(listaNota.ToString());
                }
            }
        }

        protected void GridDetallesContra_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridDetallesContra.SelectedIndex;
            int NumId = Convert.ToInt32(GridDetallesContra.Rows[NumRenglon].Cells[0].Text);
            det.Bajas(NumId);
            GridDetallesContra.DataSource = det.MostrarDetalleContrar();
            GridDetallesContra.DataBind();
        }

        protected void btnRegistrarDetallesContra_Click(object sender, EventArgs e)
        {
            string nombreo = Regex.Match(DropListNombreObra.SelectedValue, @"^.*?(?=\d{4}-\d{2}-\d{2})").Value.Trim();
            int idobra = Convert.ToInt32(det.DevuelveIDObraXNombre(nombreo));
            int contra = det.DevuelveIDContraReciboXIdobra(idobra);
            string nombreCompleto = DropListNota1.SelectedValue;
            string[] partes = nombreCompleto.Split(' ');
            string nombre = partes[0];

            int idnota = Convert.ToInt32(det.obtenerIdNotaCompraXNotafolio(Convert.ToInt32(nombre)));
            int detnota = Convert.ToInt32(det.obtenerIdDetallesNotaXIdNotaCompra(idnota));
            if (detnota ==0)
            {
                lbRespuesta.Text = "No hay un Detalles nota con Folio ocupado";
            }
            else
            {
                DetallesContrareciboClass Nueva = new DetallesContrareciboClass
                {
                    contrarecibo = contra,
                    nota = detnota,
                    total = Convert.ToDouble(txtTotal.Text),
                    pagada = Convert.ToInt32(txtPagada.Text),
                    extra = txtExtra.Text
                };

                lbRespuesta.Text = det.InsertarDetallesContraRecibo(Nueva);
                GridDetallesContra.DataSource = det.MostrarDetalleContrar();
                GridDetallesContra.DataBind();
            }
           
        }
    }
}