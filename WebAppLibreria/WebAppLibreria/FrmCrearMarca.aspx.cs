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
    public partial class FrmCrearMarca : System.Web.UI.Page
    {
        MarcaDAO daoT = new MarcaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            var nuevaMarca = new Marca()
            {
                Codigo = this.txtCodigo.Text,
                Nombre = this.txtNombre.Text,
                Descripcion = this.txtDescripcion.Text
            };
            daoT.Crear(nuevaMarca);
            Response.Redirect("FrmMarca.aspx");
        }
    }
}