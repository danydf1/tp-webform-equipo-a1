<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_webform_equipo_a1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <%if (Carrito != null)
            { %>
        <div class="row">
            <div class="col-12">

                <table class="table table-striped table-secondary text-center">
                    <thead>
                        <tr>
                            <th scope="col">Producto</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Subtotal</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in Carrito.Items)
                            {%>
                        <tr>

                            <th scope="row">
                                <div class="d-flex flex-row mb-2 justify-content-between">
                                    <img src="<%: item.Articulo.Imagenes.First().ImagenUrl %>" alt="Alternate Text" class="p-2" />
                                    <p class="p-2"><%: item.Articulo.Nombre%></p>
                                </div>
                            </th>
                            <td>
                                <p class="p-2"><%: item.Articulo.Precio%></p>
                            </td>
                            <td>
                                <input type="number" min="1" value="<%: item.Cantidad%>" />
                            </td>
                            <td>
                                <p class="p-2"><%: item.SubTotal%></p>
                            </td>
                            <td>
                                <button title="Quitar">X</button>
                            </td>

                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="row">
            <div class="col-6"></div>
            <div class="col-6 d-flex align-items-end flex-column mb-3">
                <div class="d-flex flex-row mb-3">
                    <h5 class="p-2 g-col-6">SubTotal</h5>
                    <p class="p-2 g-col-6">000</p>
                </div>
                <div class="d-flex flex-row mb-3 justify-content-between">
                    <h5 class="p-2 g-col-6">Total</h5>
                    <p class="p-2 g-col-6">000</p>
                </div>
            </div>
        </div>
        <% }
            else
            {%>
        <div class="row">
            <div class="col-12">
                <h1>No hay Articulos en el carrito</h1>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>
