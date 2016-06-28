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
    public partial class FrmCrearProducto : System.Web.UI.Page
    {
        ProductoDAO dao = new ProductoDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ComboTipoProducto();
            }
        }
        protected void ComboTipoProducto()
        {
            var daoTP = new TipoProductoDAO();
            var listado = dao.ListarTodos();
            this.ddlTipoProducto.DataSource = listado;
            this.ddlTipoProducto.DataTextField = "Nombre";
            this.ddlTipoProducto.DataValueField = "Id";
            this.ddlTipoProducto.DataBind();

        }
    }
}