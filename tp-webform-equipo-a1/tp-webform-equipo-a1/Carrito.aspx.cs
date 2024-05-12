using Dominio;
using System;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_a1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Carrito Carrito { set; get; }
        public decimal Total
        {
            get
            {
                if (Carrito != null)
                {
                    return Carrito.totalCarrito(Carrito);
                }
                else
                {
                    return 0;
                }

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] != null)
            {
                Carrito = (Carrito)Session["Carrito"];
                if (!IsPostBack)
                {
                    repetidor.DataSource = Carrito.Items;
                    repetidor.DataBind();
                }
            }
        }

        protected void BtnQuitar_Click(object sender, EventArgs e)
        {
            ItemCarrito itemSeleccionado = new ItemCarrito();
            var IdArticulo = ((Button)sender).CommandArgument;

            itemSeleccionado = Carrito.Items.Find(x => x.Articulo.Codigo == IdArticulo);

            Carrito.Items.Remove(itemSeleccionado);
            Session.Add("Carrito", Carrito);

            repetidor.DataSource = Carrito.Items;
            repetidor.DataBind();

            Response.Redirect("~/Carrito.aspx");
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(((TextBox)sender).Text) > 0)
            {
                lblCantidad.Text = ((TextBox)sender).Text;
                int cantidad = Convert.ToInt32(((TextBox)sender).Text);
                var Item = Carrito.Items.Find(x => x.Articulo.Id == Convert.ToInt32(((TextBox)sender).ToolTip));
                Item.Cantidad = cantidad;
                Item.SubTotal = Item.Articulo.Precio * cantidad;

                Session.Add("Carrito", Carrito);

                repetidor.DataSource = Carrito.Items;
                repetidor.DataBind();
            }
        }
    }
}