using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppLibreria.Dominio
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string ApePater { get; set; }
        public string ApeMater { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Usuario { get; set; }
        public string Clave { get; set; }
        public TipoDocumento TipoDocumento { get; set; }
        public Distrito Distrito { get; set; }
    }
}