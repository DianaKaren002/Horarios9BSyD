<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradoEsp.aspx.cs" Inherits="Horarios.GradoEsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grado</title>
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
    <form id="form1" runat="server">
        <h2>Gestion de Grados Especialidad</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Grados" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Grados Especialidad:
    <div style="justify-content: center; display: flex;">
        <asp:GridView ID="GridGradsEsp" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridGradsEsp_SelectedIndexChanged" >
            <Columns>
                <asp:BoundField DataField="idgradosespecialidad" HeaderText="Id" />
                <asp:BoundField DataField="grado" HeaderText="Grado" />
                <asp:BoundField DataField="Extra" HeaderText="Extra" />
                <asp:CommandField HeaderText="Eliminar" SelectText="Borrar grado" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
            </Columns>
        </asp:GridView>
    </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomgrado" class="form-control" placeholder="Escribe acronimos del grado" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtExtra" class="form-control" placeholder="extra p.e. 2012" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarGrado" runat="server" Text="Registrar Grado" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarGrado_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Grado especialidad:
    <div class="mb-3">
        <asp:DropDownList ID="DropListGrados" runat="server" ></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar grado" OnClick="btnSeleccionar_Click" />
    </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombGrado" class="form-control" placeholder="Escribe Nombre del grado" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarGrado" runat="server" Text="Editar Grado" CssClass="btn-outline-warning btn-3" OnClick="btnEditarGrado_Click" />
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
