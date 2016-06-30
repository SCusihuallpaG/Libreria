using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Persistencia
{
    public class ConexionUtil
    {
        public static string ObtenerCadena()
        {
            return "server=(local);database=Libreria; Integrated Security =True";
        }
    }
}