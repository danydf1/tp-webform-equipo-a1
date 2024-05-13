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

        protected void Page_Load(object sender, EventArgs e)
        {

            ImagenNegocio imagenNegocio = new ImagenNegocio();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lstImagenes = imagenNegocio.listar();
            lstArticulo = articuloNegocio.Listar();
            
            int id = int.Parse(Request.QueryString["id"]);

            articuloSeleccionado = lstArticulo.Find(art => art.Id == id);
            imagenArticulo = lstImagenes.FindAll(img => img.IdArticulo == id);

        }
    }
}