using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppLibreria.Dominio
{
    public class Empleado
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Clave { get; set; }
        public string Nombre { get; set; }
        public string ApePater { get; set; }
        public string ApeMater { get; set; }
        public decimal Sueldo { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public Distrito Distrito { get; set; }
    }
}