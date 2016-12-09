using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace XJ.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Article2Html",
                url: "Articles/{doi1}/{doi2}",
                defaults: new { controller = "Articles", action = "ArticleToHtml", doi1 = UrlParameter.Optional, doi2 = UrlParameter.Optional },
                namespaces: new string[] { "XJ.Web.Controllers" }
                );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "XJ.Web.Controllers" }
            );
        }
    }
}