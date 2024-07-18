<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edificio.aspx.cs" Inherits="Horarios.Edificio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Edificios</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Edificios" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Edificios:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridEdificios" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridEdificios_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IdEdificio" HeaderText="Id" />
                        <asp:BoundField DataField="NombreEdificio" HeaderText="Nombre" />
                        <asp:BoundField DataField="DescripcionEdif" HeaderText="Descripción" />
                        <asp:BoundField DataField="NombreDivision" HeaderText="Division" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar edificio" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomEdif" class="form-control" placeholder="Escribe Nombre del Edificio" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripEdif" class="form-control" placeholder="Descripción del edificio" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListDivisionId" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarEdificio" runat="server" Text="Registrar edificio" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarEdificio_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            Editar informacion Edificio:
            <div class="mb-3">
                <asp:DropDownList ID="DropListEdificio" runat="server"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Edificio" OnClick="btnSeleccionar_Click" />
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditNombreEdif" class="form-control" placeholder="Escribe Nombre del Edificio" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditDescripcion" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label ID="lbDivision" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropListEditDivisionId" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnEditarEdif" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarEdif_Click" />
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
