using ClassEntities;
using ClassMetodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class DetalleNotaVista : System.Web.UI.Page
    {
        //llamara ala clase 
        DetallenotaGestion Notas = new DetallenotaGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridMostarDetalleNota.DataSource = Notas.MostrarDetallenota();
            GridMostarDetalleNota.DataBind();

            if (!this.IsPostBack)
            {
                DropNota.Items.Clear();
                foreach (string id in Notas.Folionotas())
                {
                    DropNota.Items.Add(id.ToString());
                }

                DropMaterial.Items.Clear();
                foreach (string cad in Notas.DevuelveNombreMaterial())
                    DropMaterial.Items.Add(cad);

               
            }
        }

        protected void GridMostarDetalleNota_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridMostarDetalleNota.SelectedIndex;
            int NumId = Convert.ToInt32(GridMostarDetalleNota.Rows[NumRenglon].Cells[0].Text);
            Notas.Bajas(NumId);
            GridMostarDetalleNota.DataSource = Notas.MostrarDetallenota();
            GridMostarDetalleNota.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idmaterial = Convert.ToInt32(Notas.obtenerIdMaterial(DropMaterial.SelectedValue));
            string nombreCompleto = DropNota.SelectedValue;
            string[] partes = nombreCompleto.Split(' ');
            string nombre = partes[0];
            int idnota = Convert.ToInt32(Notas.obtenerIdNotaCompraXNotafolio(Convert.ToInt32(nombre)));
            
            DetallesNota Nueva = new DetallesNota()
            {
                nota = idnota,
                material = idmaterial,
                cantidad = Convert.ToInt32(TxtCantidad.Text),
                PrecioUnitario = Convert.ToInt32(TxtPrecioU.Text),
                extra = TxtExtra.Text
            };

            lbRespuesta.Text = Notas.InsertarDetallesNota(Nueva);
            GridMostarDetalleNota.DataSource = Notas.MostrarDetallenota();
            GridMostarDetalleNota.DataBind();
        }
    }
}