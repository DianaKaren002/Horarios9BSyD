<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignaturas.aspx.cs" Inherits="Horarios.Asignaturas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Asignatura</title>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           
             <section class="container">
     <h2 class="title_utp">Gestion de asignaturas</h2>
     <div class="field">
    <div class="control">
                <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Asignatura" OnClientClick="mostrarPopup(); return false;" />
           </div>
 </div>
<div>
            <div class="mb-3">
                <asp:Button ID="btnEditar" runat="server" CssClass="button-Pg is-rounded" Text="Editar Asignatura"  OnClientClick="mostrarPopup2(); return false;" />
            </div>
            Mostrar Areas existentes:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridAsignaturas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAsignaturas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idasignatura" HeaderText="Id" />
                        <asp:BoundField DataField="NomAsignatura" HeaderText="Asignatura" />
                        <asp:BoundField DataField="DescripcionAsig" HeaderText="Descripcion" />
                        <asp:BoundField DataField="HrsxSemana" HeaderText="Horas a la semana" />
                        <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Asignatura" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>

                    <div class="mb-3">
                        <asp:TextBox ID="txtNomAsignatura" class="form-control" placeholder="Escribe Nombre Asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripcionAsig" class="form-control" placeholder="Descripcion asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtHoras" class="form-control" placeholder="Horas por semana" runat="server" />
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtCuatrimestre" class="form-control" placeholder="Cuatrimestre p.e:5" runat="server" />
                    </div>

                    <div class="mb-3">
                        <asp:Button ID="btnInsertarAsignatura" runat="server" CssClass="button-Pg is-rounded" Text="Insertar Asignatura"  OnClick="btnInsertarAsignatura_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div id="popup2" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup2()">&times;</span>

                    <div class="mb-3">
                        <asp:DropDownList ID="DropListAsignatura" runat="server" OnSelectedIndexChanged="DropListAsignatura_SelectedIndexChanged"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Asignatura" OnClick="btnSeleccionar_Click" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtEditNomb" class="form-control" placeholder="Escribe Nombre Asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtEditDesc" class="form-control" placeholder="Descripcion asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtEditHora" class="form-control" placeholder="Horas por semana" runat="server" />
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtEditCuatri" class="form-control" placeholder="Cuatrimestre p.e:5" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnEditarAsig" runat="server" CssClass="button-Pg is-rounded" Text="Editar Asignatura" OnClick="btnEditarAsig_Click" />
                    </div>
                </div>
            </div>
        </div>
                 </section>
    </form>
    <script src="scrips/popup.js"></script>

</body>
</html>
