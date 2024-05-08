using Dominio;
using System;

namespace tp_webform_equipo_a1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Carrito Carrito { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] != null)
            {
                Carrito = (Carrito)Session["Carrito"];
            }
        }
    }
}