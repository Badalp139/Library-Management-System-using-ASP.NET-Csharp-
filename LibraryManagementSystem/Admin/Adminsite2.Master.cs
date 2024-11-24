using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class Adminsite2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminrole"] != null && Session["Adminrole"].ToString() == "Admin")
            {
                if (!IsPostBack)
                {
                    lblUserName.Text = "Hi," + Session["Adminusername"].ToString();
                }

            }
            else
            {
                Response.Redirect("~/signout.aspx");
            }
        }
    }
}