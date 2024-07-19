<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HorarioVis.aspx.cs" Inherits="Horarios.HorarioVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Horarios</title>
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
            </div>
        </div>
    </div>
</nav>
         <section class="container">
     <h2 class="title_utp">Gestion de Horarios</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Horario" OnClientClick="mostrarPopup(); return false;" />
        </div>
         </div>
        <div>
               <h2 class="titles"> Lista Horarios:</h2>
           
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridHorarios" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridHorarios_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idHorario" HeaderText="Id" />
                        <asp:BoundField DataField="NomDia" HeaderText="Dia" />
                        <asp:BoundField DataField="HrInicio" HeaderText="Inicio" />
                        <asp:BoundField DataField="HrFinal" HeaderText="Final" />
                        <asp:BoundField DataField="idAsignacion" HeaderText="Asignacion" />
                        <asp:BoundField DataField="NomGrupo" HeaderText="Grupo" />
                        <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" />
                        <asp:BoundField DataField="Turno" HeaderText="Turno" />
                        <asp:BoundField DataField="NombrePeriodo" HeaderText="Periodo" />
                        <asp:BoundField DataField="NombAula" HeaderText="Aula" />
                        <asp:BoundField DataField="Nombre" HeaderText="Docente" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListAsignacionId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListDiaID" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtHrInicio" class="form-control" placeholder="Hora Inicio" runat="server" />
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtHrFin" class="form-control" placeholder="Hora fin" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListAulaID" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarHorario" runat="server" CssClass="button-Pg is-rounded" Text="Registrar " OnClick="btnRegistrarHorario_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>

             <h2 class="titles">Editar informacion Horario:</h2>
             <div class="mb-3">
                <asp:DropDownList ID="DropListIdHorario" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Edificio" />
            </div>
            <div class="mb-3">
                <asp:DropDownList ID="DropListEditAsigId" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:DropDownList ID="DropListEditDiaID" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <input type="number" id="txtEditHrIni" class="form-control" placeholder="Hora Inicio" runat="server" />
            </div>
            <div class="mb-3">
                <input type="number" id="txtEditHrFin" class="form-control" placeholder="Hora fin" runat="server" />
            </div>
            <div class="mb-3">
                <asp:DropDownList ID="DropListEditAula" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarHorario" runat="server" CssClass="button-Pg is-rounded" Text="Editar" />
            </div>
        </div>
   </section>
    </form>
</body>
</html>
