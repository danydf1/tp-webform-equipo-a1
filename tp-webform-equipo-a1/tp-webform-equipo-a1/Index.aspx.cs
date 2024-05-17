using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_a1
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        public List<Articulo> lstArticulo { get; set; }
        public List<Imagen> lstImagenes { get; set; }
        public List<Categoria> lstCategorias { get; set; }
        public List<Marca> lstMarcas { get; set; }
        public Carrito carrito;


        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            ImagenNegocio imagenNegocio = new ImagenNegocio();



            carrito = (Carrito)Session["carrito"];

            if (carrito == null)
            {
                carrito = new Carrito();

                if (carrito.Items == null) carrito.Items = new List<ItemCarrito>();
            }

            lstImagenes = imagenNegocio.listar();
            lstArticulo = articuloNegocio.Listar();
            lstCategorias = new List<Categoria>();
            lstMarcas = new List<Marca>();
            
            if (!IsPostBack)
            {

                repetidor.DataSource = lstArticulo;
                repetidor.DataBind();

                lstCategorias.Add(new Categoria { Id = 0, Descripcion = "Todas" });
                lstMarcas.Add(new Marca { Id = 0, Descripcion = "Todas" });
                foreach (var item in lstArticulo)
                {
                    if (!lstCategorias.Contains(item.Categoria))
                        lstCategorias.Add(item.Categoria);

                    if (!lstMarcas.Contains(item.Marca))
                        lstMarcas.Add(item.Marca);
                }

                filtroCategorias.DataSource = lstCategorias;
                filtroCategorias.DataValueField = "Id";
                filtroCategorias.DataTextField = "Descripcion";
                filtroCategorias.DataBind();

                filtroMarcas.DataSource = lstMarcas;
                filtroMarcas.DataValueField = "Id";
                filtroMarcas.DataTextField = "Descripcion";
                filtroMarcas.DataBind();
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ItemCarrito itemCarrito;

            string IdArticulo = ((Button)sender).CommandArgument;

            if (!carrito.Items.Exists(x => x.Articulo.Id == Convert.ToInt32(IdArticulo)))
            {
                itemCarrito = new ItemCarrito();

                itemCarrito.Articulo = (Articulo)lstArticulo.Find(x => x.Id == Convert.ToInt32(IdArticulo));
                itemCarrito.Cantidad = 1;
                itemCarrito.SubTotal = itemCarrito.Articulo.Precio * itemCarrito.Cantidad;

                carrito.Items.Add(itemCarrito);

                Session.Add("Carrito", carrito);
            }
            else
            {
                int indexItem = carrito.Items.FindIndex(x => x.Articulo.Id == Convert.ToInt32(IdArticulo));
                itemCarrito = carrito.Items.Find(x => x.Articulo.Id == Convert.ToInt32(IdArticulo));
                itemCarrito.Cantidad += 1;
                itemCarrito.SubTotal = itemCarrito.Articulo.Precio * itemCarrito.Cantidad;

                carrito.Items[indexItem] = itemCarrito;

                Session.Add("Carrito", carrito);
            }

            Response.Redirect("~/Index.aspx"); 
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string buscar = txtSearch.Value;

            lstArticulo = lstArticulo.FindAll(x => x.Nombre.Contains(buscar) || x.Descripcion.Contains(buscar) || x.Categoria.Descripcion.Contains(buscar) || x.Marca.Descripcion.Contains(buscar));

            repetidor.DataSource = lstArticulo;
            repetidor.DataBind();
        }

        protected void btnAplicarFiltros_Click(object sender, EventArgs e)
        {
            string filtroCat = filtroCategorias.SelectedItem.Text;
            string filtroMarc = filtroMarcas.SelectedItem.Text;
            string filtroPrecMin = filtroPrecioMin.Value;
            string filtroPrecMax = filtroPrecioMax.Value;

            if (filtroCat != null && filtroCat != "Todas")
                lstArticulo = lstArticulo.FindAll(x => x.Categoria.Descripcion == filtroCat);

            if (filtroMarc != null && filtroMarc != "Todas")
                lstArticulo = lstArticulo.FindAll(x => x.Marca.Descripcion == filtroMarc);

            if (filtroPrecMin != null && filtroPrecMin != "0" && filtroPrecMin != "")
                lstArticulo = lstArticulo.FindAll(x => x.Precio >= Convert.ToDecimal(filtroPrecMin));

            if (filtroPrecMax != null && filtroPrecMax != "0" && filtroPrecMax != "")
                lstArticulo = lstArticulo.FindAll(x => x.Precio <= Convert.ToDecimal(filtroPrecMax));

            repetidor.DataSource = lstArticulo;
            repetidor.DataBind();
        }
    }
}