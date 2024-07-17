using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassMetodos;

namespace Horarios
{
    public partial class Asignaturas : System.Web.UI.Page
    {
        AsignaturasGestion asig = new AsignaturasGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();
        }

        protected void GridAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int NumRenglon = GridAsignaturas.SelectedIndex;
            int NumId = Convert.ToInt32(GridAsignaturas.Rows[NumRenglon].Cells[0].Text);
            //asig.Bajas(NumId);
            GridAsignaturas.DataSource = asig.MostrarAsignaturas();
            GridAsignaturas.DataBind();
        }
    }
}