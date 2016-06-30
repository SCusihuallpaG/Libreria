using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Models
{
    public class SubCategoria
    {
        public string SubCatID { get; set; }
        public string Nombre { get; set; }
        public Categoria CategoriaID { get; set; }
    }
}