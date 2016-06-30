using VictoriaWeb.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppTiendaWeb
{
    /// <summary>
    /// Descripción breve de ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {


        public void ProcessRequest(HttpContext context)
        {
            var request = context.Request;
            if(!string.IsNullOrEmpty(request.QueryString["id"]))
            {
                int id=int.Parse(request.QueryString
                    ["id"].ToString());
                var pDAO= new ProductoDAO();
                var p=pDAO.Obtener(id);
                if(p!= null)
                {
                    if (p.Foto != null && p.Foto.Length > 0)
                    {
                        context.Response.ContentType = "image/jpeg";
                        context.Response.BinaryWrite(p.Foto);
                    }

                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}