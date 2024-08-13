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
    public partial class ContrareciboVista : System.Web.UI.Page
    {
        ContrareciboGestion contra = new ContrareciboGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridContrarecibos.DataSource = contra.MostrarContraRecibo();
            GridContrarecibos.DataBind();

            if (!this.IsPostBack)
            {
                DropListNombreObra.Items.Clear();
                foreach (string Contrareci in contra.NombresObras())
                {
                    DropListNombreObra.Items.Add(Contrareci.ToString());
                }
            }
        }

        protected void GridContrarecibos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridContrarecibos.SelectedIndex;
            int NumId = Convert.ToInt32(GridContrarecibos.Rows[NumRenglon].Cells[0].Text);
            contra.Bajas(NumId);
            GridContrarecibos.DataSource = contra.MostrarContraRecibo();
            GridContrarecibos.DataBind();
        }

        protected void btnRegistrarContra_Click(object sender, EventArgs e)
        {
            string nombreo = DropListNombreObra.SelectedValue;
            int idobra = Convert.ToInt32(contra.DevuelveIDObraXNombre(nombreo));
            Contrarecibo Nueva = new Contrarecibo
            {
                fecha = DateTime.Now,
                obra = idobra,
                extra= txtExtra.Text
            };

            lbRespuesta.Text = contra.InsertarContrarecibo(Nueva);
            GridContrarecibos.DataSource = contra.MostrarContraRecibo();
            GridContrarecibos.DataBind();
        }
    }
}