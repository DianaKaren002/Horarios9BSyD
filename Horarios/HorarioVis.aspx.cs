using ClassMetodos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class HorarioVis : System.Web.UI.Page
    {
        HorarioGestion hor = new HorarioGestion();
        AsignacionCuatriGestion asig = new AsignacionCuatriGestion();
        DiasGestion di = new DiasGestion();
        AulasGestion au = new AulasGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridHorarios.DataSource = hor.MostrarHorario();
            GridHorarios.DataBind();

            if (!this.IsPostBack)
            {
                DropListIdHorario.Items.Clear();
                foreach (int id in hor.IdsHorario())
                {
                    DropListIdHorario.Items.Add(id.ToString());
                }

                DropListAsignacionId.Items.Clear();
                foreach (int id in asig.IdsAsignacion())
                {
                    DropListAsignacionId.Items.Add(id.ToString());
                }
                DropListAsignacionId.Items.Clear();
                foreach (int id in asig.IdsAsignacion())
                {
                    DropListAsignacionId.Items.Add(id.ToString());
                }

                DropListEditAsigId.Items.Clear();
                foreach (int id in asig.IdsAsignacion())
                {
                    DropListEditAsigId.Items.Add(id.ToString());
                }

                DropListAulaID.Items.Clear();
                foreach (string cad in au.NombresAulas())
                    DropListAulaID.Items.Add(cad);

                DropListEditAula.Items.Clear();
                foreach (string cad in au.NombresAulas())
                    DropListEditAula.Items.Add(cad);

                DropListDiaID.Items.Clear();
                foreach (string cad in di.NombresDias())
                    DropListDiaID.Items.Add(cad);

                DropListEditDiaID.Items.Clear();
                foreach (string cad in di.NombresDias())
                    DropListEditDiaID.Items.Add(cad);


            }
        }

        protected void GridHorarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridHorarios.SelectedIndex;
            int NumId = Convert.ToInt32(GridHorarios.Rows[NumRenglon].Cells[0].Text);
            hor.Bajas(NumId);
            GridHorarios.DataSource = hor.MostrarHorario();
            GridHorarios.DataBind();
        }
    }
}