using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Dominio
{
    public class Cliente
    {
        public int ClienteID { get; set; }
        public int Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public Usuario Usuario { get; set; }
        public TipoDocumento TipoDocumentoID { get; set; }
        public Distrito DistritoID { get; set; }
    }
}