﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aula.aspx.cs" Inherits="Horarios.Aula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Aula</title>
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
     <h2 class="title_utp">Gestion de Aulas</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Aulas" OnClientClick="mostrarPopup(); return false;" />
       </div>
 </div>
<div>
            Lista Aulas:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridAulas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAulas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idAula" HeaderText="Id" />
                        <asp:BoundField DataField="NombAula" HeaderText="Nombre" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="NombreEdificio" HeaderText="Edificio" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Aula" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomAula" class="form-control" placeholder="Escribe Nombre del Aula" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripAula" class="form-control" placeholder="Descripción del aula" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListEdificioId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarAula" runat="server"  CssClass="button-Pg is-rounded" Text="Registrar Aula"  OnClick="btnRegistrarAula_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
            <br />
            Editar informacion Aula:
            <div class="mb-3">
                <asp:DropDownList ID="DropListAulas" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Aula" OnClick="btnSeleccionar_Click" />
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreAula" class="form-control" placeholder="Escribe Nombre del Aula" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcionAu" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label ID="lbnomEdif" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditEdificioId" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnEditarAula" runat="server" CssClass="button-Pg is-rounded" Text="Editar Aula"  OnClick="btnEditarAula_Click" />
            </div>
        </div>
         </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
