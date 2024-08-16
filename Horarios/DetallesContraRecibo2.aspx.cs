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
            try
            {
                // Verificar que el valor seleccionado no sea nulo o vacío
                if (DropListNombreObra.SelectedValue == null || DropListNombreObra.SelectedValue.Trim() == "")
                {
                    lbRespuesta.Text = "El nombre de la obra no puede estar vacío.";
                    return;
                }

                // Obtener el nombre y verificar que no sea nulo o vacío
                string nombreo = Regex.Match(DropListNombreObra.SelectedValue, @"^.*?(?=\d{4}-\d{2}-\d{2})").Value.Trim();
                if (string.IsNullOrEmpty(nombreo))
                {
                    lbRespuesta.Text = "No se pudo obtener el nombre de la obra.";
                    return;
                }

                // Convertir el ID de la obra
                string idobraString = det.DevuelveIDObraXNombre(nombreo).ToString();
                if (!int.TryParse(idobraString, out int idobra))
                {
                    lbRespuesta.Text = "ID de la obra no válido.";
                    return;
                }

                // Obtener el ID del recibo
                string contraString = det.DevuelveIDContraReciboXIdobra(idobra).ToString();
                if (!int.TryParse(contraString, out int contra))
                {
                    lbRespuesta.Text = "No se pudo obtener el ID del recibo.";
                    return;
                }

                // Verificar que el valor seleccionado no sea nulo o vacío
                if (DropListNota1.SelectedValue == null || DropListNota1.SelectedValue.Trim() == "")
                {
                    lbRespuesta.Text = "El valor de la nota no puede estar vacío.";
                    return;
                }

                // Obtener el nombre completo y dividirlo en partes
                string nombreCompleto = DropListNota1.SelectedValue;
                string[] partes = nombreCompleto.Split(' ');
                if (partes.Length == 0)
                {
                    lbRespuesta.Text = "El nombre completo no tiene el formato esperado.";
                    return;
                }
                string nombre = partes[0];

                // Convertir el ID de la nota
                if (!int.TryParse(nombre, out int idnota))
                {
                    lbRespuesta.Text = "ID de la nota no válido.";
                    return;
                }

                // Obtener el ID del detalle de la nota
                int idnota2 = Convert.ToInt32(det.obtenerIdNotaCompraXNotafolio(idnota));
                string detnotaString = det.obtenerIdDetallesNotaXIdNotaCompra(idnota2);
                if (!int.TryParse(detnotaString, out int detnota))
                {
                    lbRespuesta.Text = "No se pudo obtener el ID del detalle de la nota.";
                    return;
                }

                // Verificar si el detalle de la nota es cero
                if (detnota == 0)
                {
                    lbRespuesta.Text = "No hay un Detalle nota con Folio ocupado.";
                    return;
                }

                // Verificar y convertir valores de entrada
                if (!double.TryParse(txtTotal.Text, out double total))
                {
                    lbRespuesta.Text = "El total no es un número válido.";
                    return;
                }

                if (!int.TryParse(txtPagada.Text, out int pagada))
                {
                    lbRespuesta.Text = "El valor pagado no es un número válido.";
                    return;
                }

                // Crear el nuevo objeto de detalles
                DetallesContrareciboClass Nueva = new DetallesContrareciboClass
                {
                    contrarecibo = contra,
                    nota = detnota,
                    total = total,
                    pagada = pagada,
                    extra = txtExtra.Text
                };

                // Insertar detalles y actualizar el Grid
                lbRespuesta.Text = det.InsertarDetallesContraRecibo(Nueva);
                GridDetallesContra.DataSource = det.MostrarDetalleContrar();
                GridDetallesContra.DataBind();
            }
            catch (Exception ex)
            {
                lbRespuesta.Text = $"Error: {ex.Message}";
            }
        }

        protected void DropListNota1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}