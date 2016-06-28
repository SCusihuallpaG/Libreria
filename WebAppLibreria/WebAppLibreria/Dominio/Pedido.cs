using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppLibreria.Dominio
{
    public class Pedido
    {
        public int Id { get; set; }
        public DateTime FechaPedido { get; set; }
        public string Observacion { get; set; }
        public Cliente Cliente { get; set; }
    }
}