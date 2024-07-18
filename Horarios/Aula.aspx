<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aula.aspx.cs" Inherits="Horarios.Aula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Aulas</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Aulas" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Aulas:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridAulas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAulas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idAula" HeaderText="Id" />
                        <asp:BoundField DataField="NombAula" HeaderText="Nombre" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="NombreEdificio" HeaderText="Edificio" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Aula" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomAula" class="form-control" placeholder="Escribe Nombre del Aula" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripAula" class="form-control" placeholder="Descripción del aula" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListEdificioId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarAula" runat="server" Text="Registrar Aula" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarAula_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
            <br />
            Editar informacion Aula:
            <div class="mb-3">
                <asp:DropDownList ID="DropListAulas" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Aula" OnClick="btnSeleccionar_Click" />
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreAula" class="form-control" placeholder="Escribe Nombre del Aula" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcionAu" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label ID="lbnomEdif" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditEdificioId" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnEditarAula" runat="server" Text="Editar Aula" CssClass="btn-outline-warning btn-3" OnClick="btnEditarAula_Click" />
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
