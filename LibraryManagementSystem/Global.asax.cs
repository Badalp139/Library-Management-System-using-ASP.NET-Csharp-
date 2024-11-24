using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace LibraryManagementSystem
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition(
       "jquery",
       new ScriptResourceDefinition
       {
           Path = "~/Scripts/jquery-{version}.js", // Adjust the path as needed
           CdnPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js", // Use the version you need
           CdnDebugPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js",
           LoadSuccessExpression = "jQuery"
       });
        
    }
        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception ex = Server.GetLastError(); Server.ClearError();
            //if (ex.InnerException != null)
            //{
            //    Response.Redirect("ErrorPage.aspx?ErrorMessage=" + ex.InnerException.Message);
            //}
            //else
            //{
            //    Response.Redirect("ErrorPage.aspx?ErrorMessage=" + ex.Message);
            //}
        }
    }
}