using NHibernate;
using NHibernate.Cfg;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VictoriaWeb.Persistencia
{
    public class NHibernateHelper
    {
        private static ISessionFactory _fabrica;

        public static ISessionFactory Fabrica
        {
            get
            {
                if (_fabrica == null)
                {
                    var conf = new Configuration();
                    conf.SetProperty("connection.provider", "NHibernate.Connection.DriverConnectionProvider");
                    conf.SetProperty("connection.driver_class", "NHibernate.Driver.SqlClientDriver");
                    conf.SetProperty("connection.connection_string", ConexionUtil.ObtenerCadena());
                    conf.SetProperty("adonet.batch_size", "10");
                    conf.SetProperty("show_sql", "true");
                    conf.SetProperty("dialect", "NHibernate.Dialect.MsSql2000Dialect");
                    conf.SetProperty("command_timeout", "60");
                    conf.SetProperty("query.substitutions", "true 1, false 0, yes 'Y', no 'N'");
                    conf.AddAssembly(typeof(NHibernateHelper).Assembly);
                    _fabrica = conf.BuildSessionFactory();
                }
                return _fabrica;
            }
        }

        public static ISession ObtenerSesion()
        {
            return Fabrica.OpenSession();
        }
        public static void CerrarFabrica()
        {
            _fabrica = null;
        }
    }
}