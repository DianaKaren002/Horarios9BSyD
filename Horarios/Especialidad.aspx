<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Especialidad.aspx.cs" Inherits="Horarios.Especialidad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Especialidad</title>
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
     <h2 class="title_utp">Gestion de Especialidades</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Especialidades" OnClientClick="mostrarPopup(); return false;" />
        </div>
 </div>
<div>
            Lista Especialidades:
        <div style="justify-content: center; display: flex;">
            <asp:GridView ID="GridEspecialidades" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridEspecialidades_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="idEspecialidad" HeaderText="Id" />
                    <asp:BoundField DataField="NombreEsp" HeaderText="Nombre" />
                    <asp:BoundField DataField="DescripcionEsp" HeaderText="Descripción" />
                    <asp:BoundField DataField="NombreDivision" HeaderText="Division" />
                    <asp:BoundField DataField="grado" HeaderText="Especialidad grado" />
                    <asp:CommandField HeaderText="Eliminar" SelectText="Borrar  " ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                </Columns>
            </asp:GridView>
        </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomEsp" class="form-control" placeholder="Escribe Nombre de la especialidad" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripEsp" class="form-control" placeholder="Descripción de la especialidad" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListDivisionId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListGradoEspId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarEsp" runat="server" Text="Registrar Especialidad" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarEsp_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Especialidad:
        <div class="mb-3">
            <asp:DropDownList ID="DropListEspecialidad" runat="server"></asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Especialidad" OnClick="btnSeleccionar_Click" />
        </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreEsp" class="form-control" placeholder="Escribe Nombre de la especialidad" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcionEsp" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label ID="lbDivision" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditDivisionId" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lbGradoIdNom" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditGradoEspId" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnEditarEsp" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarEsp_Click" />
            </div>
        </div>
         </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
