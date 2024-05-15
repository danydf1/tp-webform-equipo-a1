using Dominio;
using System;

namespace tp_webform_equipo_a1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] != null)
            {
                Carrito carrito = (Carrito)Session["Carrito"];
                lblContador.Text = carrito.Items.Count.ToString();
            }
        }
    }
}