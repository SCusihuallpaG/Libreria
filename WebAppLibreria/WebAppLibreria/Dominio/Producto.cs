using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppLibreria.Dominio
{
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Marca Marca { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public byte[] Foto { get; set; }
        public TipoProducto TipoProducto { get; set; }
    }
}