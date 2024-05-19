<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="tp_webform_equipo_a1.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="wrapper">
     <div class="sidebar">
         <h6>Buscar</h6>
         <div class="input-group mb-3">
             <input type="text" class="form-control" placeholder="Buscar" aria-label="Search" aria-describedby="btnSearch" id="txtSearch" runat="server">
             <div class="input-group-append">
                 <asp:Button class="btn btn-outline-secondary" id="btnSearch" OnClick="btnSearch_Click" text="Buscar" runat="server"></asp:Button>
             </div>
         </div>
         <h6>Filtrar</h6>
         <div class="mb-3">
             <label for="filtroCategorias" class="form-label">Categoría</label>
             <asp:DropDownList class="form-control" id="filtroCategorias" name="filtroCategorias" runat="server">
             </asp:DropDownList>
         </div>
         <div class="mb-3">
             <label for="filtroMarcas" class="form-label">Marca</label>
                <asp:DropDownList class="form-control" id="filtroMarcas" name="filtroCategorias" runat="server">
               </asp:DropDownList>
         </div>
         <div class="mb-3">
                    <label class="form-label">Precio</label>
                    <div class="filtro-precio">
                        <input type="number" class="form-control" id="filtroPrecioMin" name="filtroPrecioMin" placeholder="Min" runat="server"/>
                        <span>-</span>
                        <input type="number" class="form-control" id="filtroPrecioMax" name="filtroPrecioMax" placeholder="Max" runat="server"/>
                    </div>
                </div>
         <asp:Button class="btn btn-dark" ID="btnAplicarFiltros" runat="server" Text="Aplicar filtros" OnClick="btnAplicarFiltros_Click"></asp:Button>
     </div>
     <div class="contenido">
         <div class="container">
            <div class="row">
                <asp:Repeater runat="server" ID="repetidor">
                    <ItemTemplate>
                        <div class="col-4 mb-2 ">
                            <div class="card" style="width: 18rem;">
                                <div class="card h-100">
                                    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active" data-bs-interval="10">
                                            </div>
                                            <asp:Repeater ID="imageRepeater" runat="server" DataSource='<%# ((Dominio.Articulo)Container.DataItem).Imagenes %>'>
                                                <ItemTemplate>
                                                    <div class="carousel-item" data-bs-interval="10000">
                                                        <div style="min-height: 300px" class="d-flex">
                                                            <div class="align-self-center">
                                                                <img src='<%# Eval("ImagenUrl") %>' onerror="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRObPqifjaY_XhtqkVFqR54lyFL-UL1CDwE9vSJcHWBpg&s" class="card-img-top img-fluid" alt="...">
                                                            </div>

                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <button class="carousel-control-prev d-none" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Previous</span>
                                            </button>
                                            <button class="carousel-control-next d-none" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Next</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre")%></h5>
                                    <p class="card-text"><%# Eval("Marca.Descripcion")%></p>
                                    <p class="card-text h5 mb-4"><%# Eval("Precio")%></p>
                                    <div class="row justify-content-evenly">
                                        <div class="col-4">
                                            <a href="/DetalleArticulo.aspx?id=<%# Eval("id") %>" class="btn btn-dark mr-3" />Detalle </a>
                                        </div>
                                        <div class="col-4">
                                            <asp:Button ID="btnAgregar" Text="Agregar" CssClass="btn btn-dark" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Id") %>' CommandName="IdArticulo" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
     </div>
 </div>
            
    
          

</asp:Content>
