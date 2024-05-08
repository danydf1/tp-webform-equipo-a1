using System;
using System.Collections.Generic;

namespace Dominio
{
    public class Carrito
    {
        public DateTime FechaCarrito { get; set; }
        public List<ItemCarrito> Items { get; set; }
        public decimal totalCarrito(Carrito carrito)
        {
            decimal total = 0;
            foreach (ItemCarrito item in carrito.Items)
            {

                total += item.Articulo.Precio * item.Cantidad;
            }
            return total;
        }
    }
}
