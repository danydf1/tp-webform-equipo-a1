using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_a1
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        public List<Articulo> lstArticulo { get; set; }
        public List<Imagen> lstImagenes { get; set; }
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
            if (!IsPostBack)
            {

                repetidor.DataSource = lstArticulo;
                repetidor.DataBind();
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
    }
}