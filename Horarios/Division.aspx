<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Division.aspx.cs" Inherits="Horarios.Division" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Divisiones</h2>
<div class="mb-3">
    <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Divisiones" OnClientClick="mostrarPopup(); return false;" />
</div>
<div>
    Lista divisiones:
    <div style="justify-content: center; display: flex;">
        <asp:GridView ID="GridDivisiones" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridDivisiones_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id_Division" HeaderText="Id" />
                <asp:BoundField DataField="NombreDivision" HeaderText="Nombre" />
                <asp:BoundField DataField="DescripcionDiv" HeaderText="Descripción" />
                <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Division" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
            </Columns>
        </asp:GridView>
    </div>
    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close" onclick="cerrarPopup()">&times;</span>
            <div class="mb-3">
                <asp:TextBox ID="txtNomDiv" class="form-control" placeholder="Escribe Nombre de la division" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtDescripcion" class="form-control" placeholder="Descripción" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnRegistrarDiv" runat="server" Text="Registrar" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarDiv_Click" />
            </div>
            <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
        </div>
    </div>
    Editar informacion Division:
    <div class="mb-3">
        <asp:DropDownList ID="DropListDivision" runat="server" OnSelectedIndexChanged="DropListDivision_SelectedIndexChanged" ></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Division" OnClick="btnSeleccionar_Click" />
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtEditNombreDiv" class="form-control" placeholder="Escribe Nombre de la division" runat="server"></asp:TextBox>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtEditDescripcion" class="form-control" placeholder="Descripcion" runat="server"></asp:TextBox>
    </div>
    <div class="mb-3">
        <asp:Button ID="btnEditarDiv" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarDiv_Click" />
    </div>
</div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
