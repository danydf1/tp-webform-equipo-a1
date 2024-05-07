<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="tp_webform_equipo_a1.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <%foreach (Dominio.Articulo item in lstArticulo)
                {%>
                <div class="col-4 mb-2">
                    <div class="card" style="width: 18rem;;">
                        <img src="<%= item.Imagenes.Count > 0 ? item.Imagenes.First().ImagenUrl : "" %>" width="286" heigth="286" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= item.Nombre%></h5>
                            <p class="card-text"><%= item.Descripcion%></p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

</asp:Content>
