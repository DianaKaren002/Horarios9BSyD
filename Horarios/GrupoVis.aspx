<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrupoVis.aspx.cs" Inherits="Horarios.GrupoVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Grupos</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Grupos" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Grupos:
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
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListPeriodoId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListAulaID" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListTutorID" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListEspecialidadID" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarGrupo" runat="server" Text="Registrar Grupo" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarGrupo_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Gupo:
    <div class="mb-3">
        <asp:DropDownList ID="DropListGrupos" runat="server"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click" />
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
            <div class="mb-3">
                Periodo actual:<asp:Label ID="lbPeriodoEdit" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropListEditPeridoID" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                Aula Actual<asp:Label ID="lbAulaEdit" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropListEditAulaID" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                Tutor actual:<asp:Label ID="lbTutorEdit" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropListEditTutorID" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                Especialidad actual: <asp:Label ID="lbEspecialidadEDit" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropListEditEspID" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarGrupo" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarGrupo_Click"/>
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>

