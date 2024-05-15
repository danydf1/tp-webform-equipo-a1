﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="tp_webform_equipo_a1.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">

                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="<%:imagenArticulo[0].ImagenUrl %>" id="imgDetallePrincipal" />

                    </div>
                    <div class="d-flex justify-content-center mb-3">

                        <% foreach (Dominio.Imagen img in imagenArticulo)
                            {%>
                        <a data-fslightbox="mygalley" class="border mx-1 rounded-2 item-thumb" data-type="image" href="#">
                            <img width="60" height="60" class="rounded-2" src="<%: img.ImagenUrl %>" onclick="cambiarImagen(event)" />
                        </a>
                        <%} %>
                    </div>

                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark"><%: articuloSeleccionado.Nombre %></h4>
                        <div class="d-flex flex-row my-3">
                            <div class="text-warning mb-1 me-2">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span class="ms-1">4.5
                                </span>
                            </div>

                            <span class="text-success ms-2">En Stock</span>
                        </div>

                        <div class="mb-3">
                            <span class="h5">$<%: articuloSeleccionado.Precio %></span>
                            <span class="text-muted">/ por unidad</span>
                        </div>

                        <p>
                            <%: articuloSeleccionado.Descripcion %>
                        </p>

                        <div class="row">
                            <dt class="col-3">Marca</dt>
                            <dd class="col-9"><%: articuloSeleccionado.Marca %></dd>

                            <dt class="col-3">Categoria:</dt>
                            <dd class="col-9"><%: articuloSeleccionado.Categoria %></dd>

                            <dt class="col-3">Codigo</dt>
                            <dd class="col-9"><%: articuloSeleccionado.Codigo %></dd>
                        </div>
                        <hr />

                        <div class="col-md-4 col-6 mb-3">
                            <label class="mb-2 d-block">Cantidad</label>
                            <div class="input-group mb-3" style="width: 170px;">
                                <asp:Button runat="server" Text="-" CssClass="btn btn-white border border-secondary px-3" type="button" ID="btnRestar" data-mdb-ripple-color="dark" OnClick="btnRestar_Click" />

                                <asp:TextBox runat="server" Text="1" ReadOnly="true" CssClass="form-control text-center border border-secondary" aria-label="Example text with button addon" aria-describedby="button-addon1" ID="detalleCantidad" />
                                <asp:Button runat="server" Text="+" CssClass="btn btn-white border border-secondary px-3" type="button" ID="btnSumar" data-mdb-ripple-color="dark" OnClick="btnSumar_Click" />
                            </div>
                        </div>
                    </div>


                    <asp:Button Text="Agregar al Carrito" ID="btnAgregarCarrito" runat="server" CssClass="btn btn-primary shadow-0" OnClick="btnAgregarCarrito_Click" />

                    <a href="/index.aspx" class="btn btn-danger shadow-0">Volver</a>
                </main>
            </div>
        </div>
    </section>

</asp:Content>
