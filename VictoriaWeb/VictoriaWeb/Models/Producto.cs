using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class Producto
    {
        public int ProductoID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Marca MarcaID { get; set; }
        public string Color { get; set; }
        public string Tamano { get; set; }
        public string UNIDMedida { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public byte[] Foto { get; set; }
        public TipoProducto TipoProdId { get; set; }

    }
}