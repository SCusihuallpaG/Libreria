using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppLibreria.Dominio
{
    public class DetallePedido
    {
        public Pedido Pedido { get; set; }
        public Producto Producto { get; set; }
        public decimal Igv { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}