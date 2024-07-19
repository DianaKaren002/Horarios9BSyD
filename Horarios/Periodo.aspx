<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Periodo.aspx.cs" Inherits="Horarios.Periodo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>Periodos</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css" />
<link href="CSS/Navar.css" rel="stylesheet" />
<link href="CSS/txtyBtn.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <nav class="container navbar is-primary">
     <div class="navbar-brand">
         <div class="level">
             <div class="level-item has-text-centered">
                 <figure class="image is-128x128">
                     <img class="small-image" src="Img/logo_utp.png" alt="img_utp" />
                 </figure>
             </div>
             <span class="navbar-burger" data-target="navbarMenu">
                 <span></span>
                 <span></span>
                 <span></span>
             </span>
         </div>
         <div id="navbarMenu" class="navbar-menu ">
             <div class="navbar-item ">
                  <a class="navbar-item " href="WebForm1.aspx">Inicio</a>
                 <a class="navbar-item " href="Periodo.aspx">Periodo</a>
                 <a class="navbar-item" href="GrupoVis.aspx">Grupo</a>
                 <a class="navbar-item" href="GradoEsp.aspx">Grado</a>
                 <a class="navbar-item" href="Especialidad.aspx">Especialidad</a>
                 <a class="navbar-item" href="Edificio.aspx">Edificio</a>
                 <a class="navbar-item" href="Docente.aspx">Docente.</a>
                 <a class="navbar-item" href="Division.aspx">Division</a>
                 <a class="navbar-item" href="Asignaturas.aspx">Asignaturas</a>
                 <a class="navbar-item" href="Aula.aspx">Aula</a>
                 <a class="navbar-item" href="AsignacionVis.aspx">Asignacion</a>
                  <a class="navbar-item" href="HorarioVis.aspx">Horarios</a>
             </div>
         </div>
     </div>
 </nav>
   <section class="container">
       <h2 class="title_utp">Gestion de Periodos</h2>
       <div class="field">
      <div class="control">
           <asp:Button ID="btnAbrirPopup" runat="server" CssClass="button-Pg is-rounded" Text="Agregar Periodos" OnClientClick="mostrarPopup(); return false;" />
      </div>
  </div>
        
           
        <div>
           <h2 class="titles">Lista de Periodos:</h2>
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
                         <h2 class="titles">Periodo inicio:</h2>
               
                        <asp:TextBox ID="txtPeriodoInicio" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                <h2 class="titles">Periodo Fin:</h2>
                        <asp:TextBox ID="txtPeriodoFin" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtAño" class="form-control" placeholder="año p.e = 2021" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnRegistrarPeriodo" runat="server" CssClass="button-Pg is-rounded" Text="Registrar Periodo" OnClick="btnRegistrarPeriodo_Click" />
                    </div>
                    <asp:Label ID="lbRespuesta" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
            <br />
             <h2 class="titles">Editar informacion Periodo:</h2>
            
    <div class="mb-3">
        <asp:DropDownList ID="DropListPeriodos" runat="server"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="btnSeleccionar" runat="server" CssClass="button-Pg is-rounded" Text="seleccionar Aula" OnClick="btnSeleccionar_Click" />
    </div>
            <div class="mb-3">
                <asp:TextBox ID="txteditNomPe" class="form-control" placeholder="Nombre Perido p.e= Mayo- Agosto 2" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                  <h2 class="titles">Periodo Inicio</h2>
               
               <asp:TextBox ID="txtEditP_inicio" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <h2 class="titles">Periodo Inicio</h2>
              
               
              <asp:TextBox ID="txtEditP_fin" runat="server" CssClass="form-control" placeholder="yyyy/mm/dd" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditAño" class="form-control" placeholder="año p.e = 2021" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtEditExtra" class="form-control" placeholder="Extra" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnEditarPeriodo" runat="server" Text="Editar Periodo" CssClass="button-Pg is-rounded" OnClick="btnEditarPeriodo_Click"/>
            </div>
        </div>
     </section>
    </form>
</body>
</html>
