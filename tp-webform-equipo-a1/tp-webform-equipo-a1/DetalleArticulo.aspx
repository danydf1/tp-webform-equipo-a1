<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="tp_webform_equipo_a1.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">

                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="<%:imagenArticulo[0].ImagenUrl %>" />

                    </div>
                    <div class="d-flex justify-content-center mb-3">

                        <% foreach (Dominio.Imagen img in imagenArticulo)
                            {%>
                        <a data-fslightbox="mygalley" class="border mx-1 rounded-2 item-thumb" data-type="image" href="#">
                            <img width="60" height="60" class="rounded-2" src="<%: img.ImagenUrl %>" />
                        </a>
                        <%} %>
                    </div>

                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark"><%: articuloSeleccionado.Descripcion %></h4>
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
                            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span>
                            <span class="text-success ms-2">In stock</span>
                        </div>

                        <div class="mb-3">
                            <span class="h5">$75.00</span>
                            <span class="text-muted">/ por unidad</span>
                        </div>

                        <p>
                            Modern look and quality demo item is a streetwear-inspired collection that continues to break away from the conventions of mainstream fashion. Made in Italy, these black and brown clothing low-top shirts for
            men.
                        </p>

                        <div class="row">
                            <dt class="col-3">Type:</dt>
                            <dd class="col-9">Regular</dd>

                            <dt class="col-3">Color</dt>
                            <dd class="col-9">Brown</dd>

                            <dt class="col-3">Material</dt>
                            <dd class="col-9">Cotton, Jeans</dd>

                            <dt class="col-3">Brand</dt>
                            <dd class="col-9">Reebook</dd>
                        </div>
                        <hr />

                        <div class="col-md-4 col-6 mb-3">
                            <label class="mb-2 d-block">Cantidad</label>
                            <div class="input-group mb-3" style="width: 170px;">
                                <button class="btn btn-white border border-secondary px-3" type="button" id="btnSumar" data-mdb-ripple-color="dark">
                                    -
                                </button>
                                <input type="text" class="form-control text-center border border-secondary" placeholder="1" aria-label="Example text with button addon" aria-describedby="button-addon1" />
                                <button class="btn btn-white border border-secondary px-3" type="button" id="btnRestar" data-mdb-ripple-color="dark">
                                    +
                                </button>
                            </div>
                        </div>
                    </div>

                    <a href="#" class="btn btn-primary shadow-0"><i class="me-1 fa fa-shopping-basket"></i>Agregar Al Carrito </a>
                    <a href="/index.aspx" class="btn btn-warning shadow-0">Volver </a>
                </main>
            </div>
        </div>
    </section>

</asp:Content>
