using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_a1
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        public List<Imagen> lstImagenes = new List<Imagen>();
        public List<Articulo> lstArticulo = new List<Articulo>();
        public Articulo articuloSeleccionado = new Articulo();
        public List<Imagen> imagenArticulo = new List<Imagen>();
        public Carrito carrito;

        protected void Page_Load(object sender, EventArgs e)
        {

            ImagenNegocio imagenNegocio = new ImagenNegocio();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lstImagenes = imagenNegocio.listar();
            lstArticulo = articuloNegocio.Listar();

            carrito = (Carrito)Session["carrito"];

            if (carrito == null)
            {
                carrito = new Carrito();

                if (carrito.Items == null) carrito.Items = new List<ItemCarrito>();
            }

            int id = int.Parse(Request.QueryString["id"]);

            articuloSeleccionado = lstArticulo.Find(art => art.Id == id);
            imagenArticulo = lstImagenes.FindAll(img => img.IdArticulo == id);

        }

        protected void btnSumar_Click(object sender, EventArgs e)
        {
            int cant = int.Parse(detalleCantidad.Text);
            cant += 1;
            detalleCantidad.Text = cant.ToString();
        }

        protected void btnRestar_Click(object sender, EventArgs e)
        {
            int cant = int.Parse(detalleCantidad.Text);
            cant -= 1;
            detalleCantidad.Text = cant.ToString();
        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            ItemCarrito itemCarrito;

            string IdArticulo = Request.QueryString["id"];

            if (!carrito.Items.Exists(x => x.Articulo.Id == Convert.ToInt32(IdArticulo)))
            {
                itemCarrito = new ItemCarrito();

                itemCarrito.Articulo = (Articulo)lstArticulo.Find(x => x.Id == Convert.ToInt32(IdArticulo));
                itemCarrito.Cantidad = int.Parse(detalleCantidad.Text); 
                itemCarrito.SubTotal = itemCarrito.Articulo.Precio;

                carrito.Items.Add(itemCarrito);

                Session.Add("Carrito", carrito);
            }
            else
            {
                int indexItem = carrito.Items.FindIndex(x => x.Articulo.Id == Convert.ToInt32(IdArticulo));
                itemCarrito = carrito.Items.Find(x => x.Articulo.Id == Convert.ToInt32(IdArticulo));
                itemCarrito.Cantidad += int.Parse(detalleCantidad.Text);
                itemCarrito.SubTotal = itemCarrito.Articulo.Precio * itemCarrito.Cantidad;

                carrito.Items[indexItem] = itemCarrito;

                Session.Add("Carrito", carrito);
            }

            Response.Redirect("~/DetalleArticulo.aspx?id=" + IdArticulo);
        }
    }
}