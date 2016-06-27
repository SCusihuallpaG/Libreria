using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppLibreria.Dominio;
using WebAppLibreria.Persistencia;

namespace WebAppLibreria
{
    public partial class FrmTipoProducto : System.Web.UI.Page
    {
        TipoProductoDAO daoT = new TipoProductoDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            var nuevoTipoProd =new TipoProducto()
            {
                Codigo=this.txtCodigo.Text,
                Nombre=this.txtNombre.Text,
                Descripcion=this.txtDescripcion.Text
            };
            daoT.Crear(nuevoTipoProd);
            Response.Redirect("FrmTipoProducto.aspx");

        }
    }
}