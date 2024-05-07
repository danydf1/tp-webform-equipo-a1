using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_webform_equipo_a1
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        public List<Articulo> lstArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lstArticulo = articuloNegocio.Listar();
        }
    }
}