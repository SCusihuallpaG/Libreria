using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class TipoProducto
    {
        public int TipoProdID { get; set; }
        public string CodigoTipoProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public TipoProducto SubTipoPro { get; set; }
    }
}