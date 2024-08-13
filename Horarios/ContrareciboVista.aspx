<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContrareciboVista.aspx.cs" Inherits="Horarios.ContrareciboVista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css" />
 <link href="CSS/Navar.css" rel="stylesheet" />
 <link href="CSS/txtyBtn.css" rel="stylesheet" />
</head>
<body>
      <nav class="container navbar is-primary">
      <div class="navbar-brand">
          <div class="level">
              <div class="level-item has-text-centered">
                  <figure class="image is-128x128">
                      <img class="small-image" src="Img/logo_utp.png" alt="img_utp" />
                  </figure>
              </div>
              <span class="navbar-burger" data-target="navbarMenu">
                  <span></span>
                  <span></span>
                  <span></span>
              </span>
          </div>
          <div id="navbarMenu" class="navbar-menu ">
              <div class="navbar-item ">
                  <a class="navbar-item " href="ContrareciboVista.aspx">Contrarecibo</a>
                  <a class="navbar-item " href="DetallesContraRecibo2.aspx">DetallesContrarecibo</a>
                  <a class="navbar-item" href="GrupoVis.aspx">Grupo</a>
                  <a class="navbar-item" href="GradoEsp.aspx">Grado</a>
                  <a class="navbar-item" href="Especialidad.aspx">Especialidad</a>
                  <a class="navbar-item" href="Edificio.aspx">Edificio</a>
                  <a class="navbar-item" href="Docente.aspx">Docente.</a>
                  <a class="navbar-item" href="Division.aspx">Division</a>
                  <a class="navbar-item" href="Asignaturas.aspx">Asignaturas</a>
                  <a class="navbar-item" href="Aula.aspx">Aula</a>
                  <a class="navbar-item" href="AsignacionVis.aspx">Asignacion</a>
                  <a class="navbar-item" href="HorarioVis.aspx">Horarios</a>
                   <a class="navbar-item" href="AsignacionVis.aspx">Asignacion</a>
              </div>
          </div>
      </div>
  </nav>
    <form id="form1" runat="server">
        <div>
            <div>
                <h2>Contrarecibos</h2>
                <asp:GridView ID="GridContrarecibos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridContrarecibos_SelectedIndexChanged" >
    <Columns>
        <asp:BoundField DataField="idcontrarecibo" HeaderText="Num" />
        <asp:BoundField DataField="fecha" HeaderText="Fecha" />
        <asp:BoundField DataField="NombreObra" HeaderText="Obra" />
        <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
        <asp:BoundField DataField="FechaInicio" HeaderText="Inicio" />
        <asp:BoundField DataField="FechaFinal" HeaderText="Fin" />
        <asp:BoundField DataField="Dueño" HeaderText="Dueño" />
        <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
        <asp:BoundField DataField="Tel_Resp" HeaderText="Telefono" />
        <asp:BoundField DataField="Correo_Resp" HeaderText="Correo" />
        <asp:BoundField DataField="extra" HeaderText="Extra" />
        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
    </Columns>
</asp:GridView>
            </div>
            <div>
                <h2>Registrar Contrarecibo</h2>
                Selecciona Nombre Obra:
                <asp:DropDownList ID="DropListNombreObra" runat="server"></asp:DropDownList>
                <br />
                Escribe extra:
                <asp:TextBox ID="txtExtra" runat="server"></asp:TextBox>
                <div class="mb-3">
                   <asp:Button ID="btnRegistrarContra" runat="server" CssClass="button-Pg is-rounded" Text="Registrar" OnClick="btnRegistrarContra_Click" />
                </div>
                <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
