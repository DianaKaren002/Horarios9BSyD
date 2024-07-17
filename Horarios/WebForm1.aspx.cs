using ClassBLLHorariosMySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Horarios
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConectarBD_Click(object sender, EventArgs e)
        {
            BLLHorarios obBL = new BLLHorarios("Server=localhost; Port=3306; Database=horariosutp9b; Uid=root; SslMode=None;");
            txtRespConex.Text = obBL.probarConexion();
        }
    }
}