<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionVis.aspx.cs" Inherits="Horarios.AsignacionVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
            <h2>Gestion de Asignaciones cuatrimestrales</h2>
    <div class="mb-3">
        <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Asignaciones" OnClientClick="mostrarPopup(); return false;" />
    </div>
    <div>
        Lista Asignaciones:
<div style="justify-content: center; display: flex;">
    <asp:GridView ID="GridAsignaciones" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAsignaciones_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="idAsignacion" HeaderText="Id" />
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
                    <asp:DropDownList ID="DropListGrupoID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="DropListDocenteID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="DropListAsignaturaID" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:Button ID="btnRegistrarAsignacion" runat="server" Text="Registrar" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarAsignacion_Click"/>
                </div>
                <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
            </div>
        </div>
        Editar informacion Asignacion:
<div class="mb-3">
    <asp:DropDownList ID="DropListAsignacionXID" runat="server"></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click"/>
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
            <asp:Button ID="btnEditarAsignacion" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarAsignacion_Click" />
        </div>
    </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
