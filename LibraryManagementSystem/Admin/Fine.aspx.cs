using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class Fine : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminusername"].ToString() == "" || Session["Adminusername"] == null)
            {
                Response.Redirect("~/signout.aspx");

            }
            else
            {
                if (!this.IsPostBack)
                {
                    BindGridData();
                }
            }
        }

        private void BindGridData()
        {
            cmd = new SqlCommand("sp_FineDetails_forAdmin", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            GridView1.DataSource = dbcon.load_Data(cmd);
            GridView1.DataBind();
        }
    }
}