using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class DetallePedido
    {
        public Pedido PedidoID { get; set; }
        public Producto ProductoID { get; set; }
        public decimal IGV { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }

    }
}