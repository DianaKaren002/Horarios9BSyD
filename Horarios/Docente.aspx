<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Docente.aspx.cs" Inherits="Horarios.Docente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Docente</title>
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
     <h2 class="title_utp">Gestion de Docentes</h2>
     <div class="field">
    <div class="control">
            <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Docente" OnClientClick="mostrarPopup(); return false;" />
       </div>
 </div>
<div>
            Lista docentes:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridDocentes" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridDocentes_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idDocente" HeaderText="Id" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="A_Paterno" HeaderText="Apellido paterno" />
                        <asp:BoundField DataField="A_Materno" HeaderText="A materno" />
                        <asp:BoundField DataField="Extra" HeaderText="Extra" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Docente" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomDocente" class="form-control" placeholder="Escribe Nombre Docente" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtA_Pat" class="form-control" placeholder="Apellido paterno" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtA_Mat" class="form-control" placeholder="Apellido materno" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarDocente" runat="server" CssClass="button-Pg is-rounded" Text="Registrar"  OnClick="btnRegistrarDocente_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion docente:
            <div class="mb-3">
                <asp:DropDownList ID="DropListDocentes" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropListDocentes_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombre" class="form-control" placeholder="Escribe Nombre Docente" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditA_pat" class="form-control" placeholder="Apellido paterno" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditA_mat" class="form-control" placeholder="Apellido materno" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarDocente" runat="server" CssClass="button-Pg is-rounded" Text="Editar" OnClick="btnEditarDocente_Click" />
            </div>
        </div>
         </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
