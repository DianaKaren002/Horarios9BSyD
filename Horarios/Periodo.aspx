<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Periodo.aspx.cs" Inherits="Horarios.Periodo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestion de Periodos</h2>
        <div class="mb-3">
            <asp:Button ID="btnAbrirPopup" runat="server" Text="Agregar Periodos" OnClientClick="mostrarPopup(); return false;" />
        </div>
        <div>
            Lista Periodos:
    <div style="justify-content: center; display: flex;">
        <asp:GridView ID="GridPeriodos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridPeriodos_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="idPeriodo" HeaderText="Id" />
        <asp:BoundField DataField="NombrePeriodo" HeaderText="Nombre" />
        <asp:BoundField DataField="P_inicio" HeaderText="Inicio" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
        <asp:BoundField DataField="P_Fin" HeaderText="Fin" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
        <asp:BoundField DataField="Año" HeaderText="Año" />
        <asp:BoundField DataField="Extra" HeaderText="Extra" />
        <asp:CommandField HeaderText="Eliminar" SelectText="Borrar" ShowSelectButton="True" ItemStyle-CssClass="btnDelete" >
            <ItemStyle CssClass="btnDelete"></ItemStyle>
        </asp:CommandField>
    </Columns>
</asp:GridView>

    </div>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="cerrarPopup()">&times;</span>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNomPeriodo" class="form-control" placeholder="Nombre Perido p.e= Mayo- Agosto 2" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        Periodo inicio:
               
                        <asp:TextBox ID="txtPeriodoInicio" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        Periodo Fin:
               
                        <asp:TextBox ID="txtPeriodoFin" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtAño" class="form-control" placeholder="año p.e = 2021" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarPeriodo" runat="server" Text="Registrar Periodo" CssClass="btn-outline-warning btn-3" OnClick="btnRegistrarPeriodo_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
            <br />
            Editar informacion Periodo:
    <div class="mb-3">
        <asp:DropDownList ID="DropListPeriodos" runat="server"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="btnSeleccionar" runat="server" Text="seleccionar Aula" OnClick="btnSeleccionar_Click" />
    </div>
            <div class="mb-3">
                <asp:TextBox ID="txteditNomPe" class="form-control" placeholder="Nombre Perido p.e= Mayo- Agosto 2" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                Periodo inicio:
               
               <asp:TextBox ID="txtEditP_inicio" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                Periodo Fin:
               
              <asp:TextBox ID="txtEditP_fin" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditAño" class="form-control" placeholder="año p.e = 2021" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarPeriodo" runat="server" Text="Editar Periodo" CssClass="btn-outline-warning btn-3" OnClick="btnEditarPeriodo_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
