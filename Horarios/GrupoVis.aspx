<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrupoVis.aspx.cs" Inherits="Horarios.GrupoVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grupos</title>
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
            <h2 class="title_utp">Gestion de Grupos</h2>
            <div class="field">
                <div class="control">
                    <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Grupos" OnClientClick="mostrarPopup(); return false;" />
               </div>
 </div>
<div>
                    <h2 class="titles">Lista Grupos::</h2>

                    <div style="justify-content: center; display: flex;">
                        <asp:GridView ID="GridGrupos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridGrupos_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdGrupo" HeaderText="Id" />
                                <asp:BoundField DataField="NomGrupo" HeaderText="Grupo" />
                                <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" />
                                <asp:BoundField DataField="Turno" HeaderText="Turno" />
                                <asp:BoundField DataField="NombrePeriodo" HeaderText="Periodo" />
                                <asp:BoundField DataField="NombAula" HeaderText="Aula" />
                                <asp:BoundField DataField="NombreDocente" HeaderText="Tutor" />
                                <asp:BoundField DataField="NombreEsp" HeaderText="Especialidad" />
                                <asp:CommandField HeaderText="Eliminar" SelectText="Borrar" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="popup" class="popup">
                        <div class="popup-content">
                            <span class="close" onclick="cerrarPopup()">&times;</span>
                            <div class="mb-3">
                                <asp:TextBox ID="txtNomGrupo" class="form-control" placeholder="Escribe Nombre Grupo" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <input type="number" id="txtCuatrimestre" class="form-control" placeholder="Cuatrimestre p.e:5" runat="server" />
                            </div>
                            <div class="mb-3">
                                <asp:DropDownList ID="DropListTurno" runat="server">
                                    <asp:ListItem>MATUTINO</asp:ListItem>
                                    <asp:ListItem>VESPERTINO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class=" column">
                                <asp:DropDownList ID="DropListPeriodoId" runat="server"></asp:DropDownList>
                            </div>
                            <div class=" column">
                                <asp:DropDownList ID="DropListAulaID" runat="server"></asp:DropDownList>
                            </div>
                            <div class=" column">
                                <asp:DropDownList ID="DropListTutorID" runat="server"></asp:DropDownList>
                            </div>
                            <div class=" column">
                                <asp:DropDownList ID="DropListEspecialidadID" runat="server"></asp:DropDownList>
                            </div>
                            <div class=" column">
                                <asp:Button ID="btnRegistrarGrupo" runat="server" CssClass="button-Pg is-rounded" Text="Registrar Grupo" OnClick="btnRegistrarGrupo_Click" />
                            </div>
                            <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <section class="container">
                    <h2 class="titles">Editar informacion Gupo:</h2>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListGrupos" runat="server"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtEditNomGrupo" class="form-control" placeholder="Escribe Nombre Grupo" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <input type="number" id="txtEditCuatri" class="form-control" placeholder="Cuatrimestre p.e:5" runat="server" />
                    </div>
                    <div class="mb-3">
                        Turno actual:<asp:Label ID="lbTurnoEdit" runat="server" Text="Label"></asp:Label>
                        <asp:DropDownList ID="DropListEditTurno" runat="server">
                            <asp:ListItem>MATUTINO</asp:ListItem>
                            <asp:ListItem>VESPERTINO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" column">
                        Periodo actual:<asp:Label ID="lbPeriodoEdit" runat="server" Text="Label"></asp:Label>
                        <asp:DropDownList ID="DropListEditPeridoID" runat="server"></asp:DropDownList>
                    </div>
                    <div class=" column">
                        Aula Actual<asp:Label ID="lbAulaEdit" runat="server" Text="Label"></asp:Label>
                        <asp:DropDownList ID="DropListEditAulaID" runat="server"></asp:DropDownList>
                    </div>
                    <div class=" column">
                        Tutor actual:<asp:Label ID="lbTutorEdit" runat="server" Text="Label"></asp:Label>
                        <asp:DropDownList ID="DropListEditTutorID" runat="server"></asp:DropDownList>
                    </div>
                    <div class=" column">
                        Especialidad actual:
                        <asp:Label ID="lbEspecialidadEDit" runat="server" Text="Label"></asp:Label>
                        <asp:DropDownList ID="DropListEditEspID" runat="server"></asp:DropDownList>
                    </div>
                    <div class=" column">
                        <asp:Button ID="btnEditarGrupo" runat="server" CssClass="button-Pg is-rounded" Text="Editar" OnClick="btnEditarGrupo_Click" />
                    </div>
                          </section>
                </div>
                 </section>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>

