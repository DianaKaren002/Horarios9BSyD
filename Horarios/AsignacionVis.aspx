<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionVis.aspx.cs" Inherits="Horarios.AsignacionVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Asignacion</title>
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
            <h2 class="title_utp">Asignaciones</h2>
            <div class="field">
                <div class="control">
                    <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Asignaciones" OnClientClick="mostrarPopup(); return false;" />
                </div>
                <div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropDownDocenteID2" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <h2 class="titles">Periodo inicio:</h2>
                        <asp:DropDownList ID="DropListPeriInicio" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <h2 class="titles">Periodo Fin:</h2>
                        <asp:DropDownList ID="DropListPeriFin" runat="server"></asp:DropDownList>
                    </div>
                    <asp:Button ID="btnMostrarProfesorXRangoPeriodo" runat="server" CssClass="button-Pg is-rounded" Text="Mostrar por rango de periodos" Width="229px" OnClick="btnMostrarProfesorXRangoPeriodo_Click" />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div>
                Lista Asignaciones:
                <div style="justify-content: center; display: flex;">
                    <asp:GridView ID="GridAsignaciones" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAsignaciones_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="idAsignacion" HeaderText="Id" />
                            <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" />
                            <asp:BoundField DataField="NomGrupo" HeaderText="Grupo" />
                            <asp:BoundField DataField="Turno" HeaderText="Turno" />
                            <asp:BoundField DataField="NombrePeriodo" HeaderText="Periodo" />
                            <asp:BoundField DataField="Año" HeaderText="Año" />
                            <asp:BoundField DataField="DocenteID" HeaderText="Id Docente" />
                            <asp:BoundField DataField="Nombre" HeaderText="Docente" />
                            <asp:BoundField DataField="A_Paterno" HeaderText="Apellido Paterno" />
                            <asp:BoundField DataField="A_Materno" HeaderText="Apellido Materno" />
                            <asp:BoundField DataField="NomAsignatura" HeaderText="Asignatura" />
                            <asp:BoundField DataField="P_inicio" HeaderText="Inicio" />
                            <asp:BoundField DataField="P_Fin" HeaderText="Fin" />
                            
                            <asp:CommandField HeaderText="Eliminar" SelectText="Borrar" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="popup" class="popup">
                    <div class="popup-content">
                        <span class="close" onclick="cerrarPopup()">&times;</span>
                        <div class="mb-3">
                            <asp:DropDownList ID="DropListGrupoID" runat="server"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:DropDownList ID="DropListDocenteID" runat="server"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:DropDownList ID="DropListAsignaturaID" runat="server"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnRegistrarAsignacion" runat="server" CssClass="button-Pg is-rounded" Text="Registrar" OnClick="btnRegistrarAsignacion_Click" />
                        </div>
                        <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                Editar informacion Asignacion:
                <div class="mb-3">
                    <asp:DropDownList ID="DropListAsignacionXID" runat="server"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click" />
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="DropListEditGrupoID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="DropListEditDocenteID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="DropListEditAsignaturaID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:Button ID="btnEditarAsignacion" runat="server" CssClass="button-Pg is-rounded" Text="Editar" OnClick="btnEditarAsignacion_Click" />
                </div>
            </div>
        </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
