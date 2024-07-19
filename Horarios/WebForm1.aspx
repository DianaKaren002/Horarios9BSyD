<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Horarios.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Horarios UTP</title>
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
                         <a class="navbar-item" href="AsignacionVis.aspx">Asignacion</a>
                    </div>
                </div>
            </div>
        </nav>
        <section>
            <div class="container">
                <div class="level-item">
                    <h2 class="title_utp">Te Damos la bienvenida a Horarios UTP</h2>
                </div>
                <div class="field">
                    <div class="control">
                        <asp:TextBox ID="txtRespConex" runat="server" CssClass="input is-info" Width="213px"></asp:TextBox>
                    </div>
                </div>
                <div class="field">
                    <div class="control">
                        <asp:Button ID="btnConectarBD" runat="server" CssClass="button-n is-rounded" Text="Conectar" OnClick="btnConectarBD_Click" />
                    </div>
                </div>
                <div class="columns ">
                    <div class="cast column ">
                        <img src="Img/castor.png" alt="img_utp" />
                    </div>

                </div>
            </div>
        </section>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const $navbarBurger = document.querySelector('.navbar-burger');
            const $navbarMenu = document.getElementById($navbarBurger.dataset.target);

            $navbarBurger.addEventListener('click', () => {
                $navbarBurger.classList.toggle('is-active');
                $navbarMenu.classList.toggle('is-active');
            });
        });
    </script>
</body>
</html>
