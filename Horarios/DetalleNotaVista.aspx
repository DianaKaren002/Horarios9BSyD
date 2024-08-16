<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleNotaVista.aspx.cs" Inherits="Horarios.DetalleNotaVista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Detalle Nota</title>
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
                <a class="navbar-item " href="DetallesContrarecibo.aspx">DetallesContrarecibo</a>
                <a class="navbar-item" href="DetalleNotaVista.aspx">Notas</a>
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
 <section>
    <form id="form1" runat="server">
        <div>
            <div>

            </div>
        </div>
        <asp:GridView ID="GridMostarDetalleNota" runat="server" Width="1005px" OnSelectedIndexChanged="GridMostarDetalleNota_SelectedIndexChanged" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="numeronota" HeaderText="Folio nota" />
                <asp:BoundField DataField="RazonSocial" HeaderText="Razon social" />
                <asp:BoundField DataField="AgenteVentas" HeaderText="Agente ventas" />
                <asp:BoundField DataField="NombreMat" HeaderText="Material" />
                <asp:BoundField DataField="Marca" HeaderText="Marca" />
                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio unitario" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        Nota<br />
        <asp:DropDownList ID="DropNota" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        Material<br />
        <asp:DropDownList ID="DropMaterial" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        Cantidad<br />
        <asp:TextBox ID="TxtCantidad" runat="server"></asp:TextBox>
        <br />
        <br />
        Precio Unitario<br />
        <asp:TextBox ID="TxtPrecioU" runat="server"></asp:TextBox>
        <br />
        <br />
        Extra<br />
        <asp:TextBox ID="TxtExtra" runat="server"></asp:TextBox>
        <br />
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </p>
        <p>
            <asp:Label ID="lbRespuesta" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
    </form>
 </section>
</body>
</html>
