<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="tp_webform_equipo_a1.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">


            <asp:Repeater runat="server" ID="repetidor">
                <ItemTemplate>
                    <div class="col-4 mb-2 ">
                        <div class="card" style="width: 18rem;">
                            <%--<img src="<%= item.Imagenes.Count > 0 ? item.Imagenes.First().ImagenUrl : "" %>" width="286" heigth="286" class="card-img-top img-fluid" alt="...">--%>
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre")%></h5>
                                <p class="card-text"><%# Eval("Descripcion")%></p>
                                <div class="row justify-content-evenly">
                                    <div class="col-4">
                                        <a href="/DetalleArticulo.aspx?id=<%# Eval("id") %>" class="btn btn-secondary mr-3" /> Detalle </a>
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="btnAgregar" Text="Agregar" CssClass="btn btn-secondary" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Id") %>' CommandName="IdArticulo" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
