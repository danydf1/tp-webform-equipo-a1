using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_a1
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        public List<Articulo> lstArticulo { get; set; }
        public List<Imagen> lstImagenes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

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

            string IdArticulo = ((Button)sender).CommandArgument;

            Session.Add("Carrito", lstArticulo.FindAll(x => x.Id == Convert.ToInt32(IdArticulo)));
        }
    }
}