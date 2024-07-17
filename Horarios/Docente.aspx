<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Docente.aspx.cs" Inherits="Horarios.Docente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Docentes</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Docente" OnClientClick="mostrarPopup(); return false;" />
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
                        <asp:Button ID="btnRegistrarDocente" runat="server" Text="Registrar" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarDocente_Click" />
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
                <asp:Button ID="btnEditarDocente" runat="server" Text="Editar" CssClass="btn-outline-warning btn-3" OnClick="btnEditarDocente_Click" />
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
