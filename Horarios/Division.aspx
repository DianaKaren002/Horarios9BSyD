﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Division.aspx.cs" Inherits="Horarios.Division" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Divicion</title>
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
        < <section class="container">
     <h2 class="title_utp">Gestion de Divisiones</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Divisiones" OnClientClick="mostrarPopup(); return false;" />
       </div>
 </div>
<div>
            Lista divisiones:
    <div style="justify-content: center; display: flex;">
        <asp:GridView ID="GridDivisiones" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridDivisiones_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id_Division" HeaderText="Id" />
                <asp:BoundField DataField="NombreDivision" HeaderText="Nombre" />
                <asp:BoundField DataField="DescripcionDiv" HeaderText="Descripción" />
                <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Division" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
            </Columns>
        </asp:GridView>
    </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomDiv" class="form-control" placeholder="Escribe Nombre de la division" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripcion" class="form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarDiv" runat="server" CssClass="button-Pg is-rounded" Text="Registrar"  OnClick="btnRegistrarDiv_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Division:
    <div class="mb-3">
        <asp:DropDownList ID="DropListDivision" runat="server" OnSelectedIndexChanged="DropListDivision_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSeleccionar" runat="server"  CssClass="button-Pg is-rounded" Text="seleccionar Division" OnClick="btnSeleccionar_Click" />
    </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreDiv" class="form-control" placeholder="Escribe Nombre de la division" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcion" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarDiv" runat="server"  CssClass="button-Pg is-rounded" Text="Editar"  OnClick="btnEditarDiv_Click" />
            </div>
        </div>
         </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
