using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class Empleado
    {
        public int EmpleadoID { get; set; }
        public TipoEmpleado TipoEmpleadoID { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public decimal Sueldo { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public Usuario Usuario { get; set; }
        public Distrito DistritoID { get; set; }


    }
}