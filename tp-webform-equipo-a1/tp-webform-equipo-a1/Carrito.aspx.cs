using Dominio;
using System;
using System.Collections.Generic;

namespace tp_webform_equipo_a1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulo> LstCarrito { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] != null)
            {
                LstCarrito = (List<Articulo>)Session["Carrito"];
            }
        }
    }
}