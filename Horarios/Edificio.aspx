<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edificio.aspx.cs" Inherits="Horarios.Edificio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Edificio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css" />
 <link href="CSS/Navar.css" rel="stylesheet" />
 <link href="CSS/txtyBtn.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                <a class="navbar-item " href="WebForm1.aspx">Inicio</a>
                <a class="navbar-item " href="Periodo.aspx">Periodo</a>
                <a class="navbar-item" href="GrupoVis.aspx">Grupo</a>
                <a class="navbar-item" href="GradoEsp.aspx">Grado</a>
                <a class="navbar-item" href="Especialidad.aspx">Especialidad</a>
                <a class="navbar-item" href="Edificio.aspx">Edificio</a>
                <a class="navbar-item" href="Docente.aspx">Docente</a>
                <a class="navbar-item" href="Division.aspx">Division</a>
                <a class="navbar-item" href="Asignaturas.aspx">Asignaturas</a>
                <a class="navbar-item" href="Aula.aspx">Aula</a>
                <a class="navbar-item" href="HorarioVis.aspx">Horarios</a>
                 <a class="navbar-item" href="AsignacionVis.aspx">Asignacion</a>
            </div>
        </div>
    </div>
</nav>
         <section class="container">
     <h2 class="title_utp">Gestion de Edificios</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Edificios" OnClientClick="mostrarPopup(); return false;" />
       </div>
 </div>
<div>
            Lista Edificios:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridEdificios" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridEdificios_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IdEdificio" HeaderText="Id" />
                        <asp:BoundField DataField="NombreEdificio" HeaderText="Nombre" />
                        <asp:BoundField DataField="DescripcionEdif" HeaderText="Descripción" />
                        <asp:BoundField DataField="NombreDivision" HeaderText="Division" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar edificio" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomEdif" class="form-control" placeholder="Escribe Nombre del Edificio" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripEdif" class="form-control" placeholder="Descripción del edificio" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListDivisionId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarEdificio" runat="server" CssClass="button-Pg is-rounded" Text="Registrar edificio"  OnClick="btnRegistrarEdificio_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Edificio:
            <div class="mb-3">
                <asp:DropDownList ID="DropListEdificio" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click" />
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreEdif" class="form-control" placeholder="Escribe Nombre del Edificio" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcion" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label ID="lbDivision" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditDivisionId" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnEditarEdif" runat="server" CssClass="button-Pg is-rounded" Text="Editar" OnClick="btnEditarEdif_Click" />
            </div>
        </div>
         </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
