<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Horarios.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      .auto-style1 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <h2>Horarios UTP no ma</h2>
        <div>
          <asp:Button ID="btnConectarBD" runat="server" Text="Conectar" OnClick="btnConectarBD_Click" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="txtRespConex" runat="server" CssClass="auto-style1" Width="213px"></asp:TextBox>

          <br />
          <br />

        </div>
    </form>
</body>
</html>
