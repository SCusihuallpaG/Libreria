using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppLibreria.Persistencia;

namespace WebAppLibreria
{
    public partial class FrmMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                CargarDatos();
            }
        }
        protected void CargarDatos()
        {
            MarcaDAO daoM = new MarcaDAO();
            var listado = daoM.ListarTodos();
            this.gvMarcas.DataSource = listado;
            this.DataBind();
            this.dlMarca.DataSource = listado;
            this.DataBind();
        }

    }
}