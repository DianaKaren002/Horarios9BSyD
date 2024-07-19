﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HorarioVis.aspx.cs" Inherits="Horarios.HorarioVis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Horarios</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Horario" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Horarios:
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
                        <asp:Button ID="btnRegistrarHorario" runat="server" Text="Registrar " CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarHorario_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Horario:
            <div class="mb-3">
                <asp:DropDownList ID="DropListIdHorario" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Edificio" />
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
                <asp:Button ID="btnEditarHorario" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" />
            </div>
        </div>
    </form>
</body>
</html>
