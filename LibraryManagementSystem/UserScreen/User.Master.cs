using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.UserScreen
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"]!=null && Session["role"].ToString()=="user")
            {
                if (!IsPostBack)
                {
                    lblUserName.Text ="Hi,"+ Session["Fullname"].ToString();
                }

            }
            else
            {
                Response.Redirect("signout.aspx");
            }
            
        }
    }
}