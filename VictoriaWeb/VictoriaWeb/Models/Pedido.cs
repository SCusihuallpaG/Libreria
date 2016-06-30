using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class Pedido
    {
        public int PedidoID { get; set; }
        public DateTime Fecha { get; set; }
        public string Observacion { get; set; }
        public Cliente Cliente { get; set; }

    }
}