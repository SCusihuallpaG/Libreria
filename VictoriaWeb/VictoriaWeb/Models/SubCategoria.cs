using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class SubCategoria
    {
        public string SubCatID { get; set; }
        public string Nombre { get; set; }
        public Categoria Categoria { get; set; }
    }
}