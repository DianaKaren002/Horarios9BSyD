<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignaturas.aspx.cs" Inherits="Horarios.Asignaturas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/StyleSheetPopup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestion de asignaturas</h2>
            <div class="mb-3">
                <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Asignatura" OnClientClick="mostrarPopup(); return false;" />
            </div>
            <div class="mb-3">
    <asp:Button ID="btnEditar" runat="server" Text="Editar Asignatura" CssClass="btn-outline-warning btn-3" OnClientClick="mostrarPopup2(); return false;" />
</div>
            Mostrar Areas existentes:
            <div style="justify-content: center; display: flex;">
                <asp:GridView ID="GridAsignaturas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAsignaturas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="idasignatura" HeaderText="Id" />
                        <asp:BoundField DataField="NomAsignatura" HeaderText="Asignatura" />
                        <asp:BoundField DataField="DescripcionAsig" HeaderText="Descripcion" />
                        <asp:BoundField DataField="HrsxSemana" HeaderText="Horas a la semana" />
                        <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" />
                        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Asignatura" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3 text-center">
                                    <img src="../fotos/logo-home-master-store.png" alt="" class="mx-auto" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomAsignatura" class="form-control" placeholder="Escribe Nombre Asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDescripcionAsig" class="form-control" placeholder="Descripcion asignatura" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnInsertarAsignatura" runat="server" Text="Insertar Asignatura" CssClass="btn-outline-warning btn-3"/>
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div id="popup2" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup2()">&times;</span>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3 text-center">
                                    <img src="../fotos/logo-home-master-store.png" alt="" class="mx-auto" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="DropListAsignatura" runat="server" ></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtEditarNomAsig" class="form-control" placeholder="Escribe Nombre Area" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnEditarAsig" runat="server" Text="Editar Asignatura" CssClass="btn-outline-warning btn-3"  />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="scrips/popup.js"></script>
</body>
</html>
