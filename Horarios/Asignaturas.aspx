<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignaturas.aspx.cs" Inherits="Horarios.Asignaturas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestion de asignaturas</h2>

            Mostrar Areas existentes:
            <asp:GridView ID="GridAsignaturas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridAsignaturas_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="idasignatura" HeaderText="Id"/>
                    <asp:BoundField DataField="NomAsignatura" HeaderText="Asignatura"/>
                    <asp:BoundField DataField="DescripcionAsig" HeaderText="Descripcion"/>
                    <asp:BoundField DataField="HrsxSemana" HeaderText="Horas a la semana"/>
                    <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre"/>
                    <asp:CommandField HeaderText="Eliminar" SelectText="Borrar Asignatura" ShowSelectButton="True" ItemStyle-CssClass="btnDelete"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
