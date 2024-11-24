using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace LibraryManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //for member login 
            SqlCommand cmd = new SqlCommand("sp_UserLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType =System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    Response.Write("<script> alert('Login successfully');</script>");
                    Session["role"] = "user";
                    Session["fullname"] = dr.GetValue(0).ToString();
                    Session["Username"] = dr.GetValue(1).ToString();
                    Session["status"] = dr.GetValue(3).ToString();
                    Session["mid"] = txtMemberID.Text;
                }
                Response.Redirect("~/UserScreen/UserHome.aspx");
            }
            else
            {
                
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Invalid credential...try again','Error')", true);
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_AdminLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", txtAdminid.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtAdminPassword.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Login successfully','success')", true);
                    Session["Adminrole"] = "Admin";
                    Session["AdminUsername"] = dr.GetValue(0).ToString();
                    Session["Adminfullname"] = dr.GetValue(2).ToString();
                    
                    //Session["status"] = dr.GetValue(3).ToString();
                }
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else
            {
                
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid credential...try again','Error')", true);
            }
        }
    }
}