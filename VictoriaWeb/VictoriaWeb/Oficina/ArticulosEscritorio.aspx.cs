using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VictoriaWeb.Persistencia;

namespace VictoriaWeb.Oficina
{
    public partial class ArticulosEscritorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if(!Page.IsPostBack)
                CargarDatos();

        }

        protected void CargarDatos()
        {
            var pDao = new ProductoDAO();
            var listado = pDao.ListarTodos();
            //this.dllistado.DataSource = listado;
            //this.dllistado.DataBind();



        }
    }
}