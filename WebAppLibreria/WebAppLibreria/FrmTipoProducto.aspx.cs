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
    public partial class FrmTipoProducto1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarDatos();
            }
        }
        protected void CargarDatos()
        {
            TipoProductoDAO daoT = new TipoProductoDAO();
            var listado = daoT.ListarTodos();
            this.gv1.DataSource = listado;
            this.gvTipoProductos.DataSource = listado;
            this.DataBind();
        }
    }
}

