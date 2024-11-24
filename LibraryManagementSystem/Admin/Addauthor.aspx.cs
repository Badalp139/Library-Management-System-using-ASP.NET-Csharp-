using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibraryManagementSystem.Admin
{
    public partial class Addauthor : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Autogenrate();
                BindRepeater();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_InsertAuthor", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",txtID.Text);
            cmd.Parameters.AddWithValue("@name",txtAuthorName.Text);
            dbcon.OpenCon();
            if(cmd.ExecuteNonQuery()==1)
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved successfully','success')", true);
                Clrcontrol();
                BindRepeater();
                Autogenrate();
            }
            else
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not inserted...try again!!!...','Error')", true);
            }

        }
        protected void Clrcontrol()
        {
            txtAuthorName.Text = txtID.Text = string.Empty;
            txtID.Focus();
        }
        public void Autogenrate()
        { 
                int r;
                dbcon.OpenCon();
                cmd = new SqlCommand("select max(author_id) as ID from author_master_tbl", dbcon.GetCon());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtID.Text = "101";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtID.Text = r.ToString();
                    }
                    txtID.ReadOnly = true;
                    


                }
                dbcon.Closecon();
            
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                searchDataforUpdate(Convert.ToInt32(id));
            }
            else if (e.CommandName == "delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                cmd = new SqlCommand("sp_DeleteAuthor", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ID", id);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    dbcon.Closecon();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Deleted successfully','success')", true);
                    Clrcontrol();
                    BindRepeater();
                    Autogenrate();
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                }
                else
                {
                    dbcon.Closecon();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not Deleted...try again!!!...','Error')", true);
                }

            }
        }

        private void searchDataforUpdate(int idd)
        {
            cmd = new SqlCommand("spGetAuthorByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID",idd);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.Closecon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["AuthorID"] = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtID.Text = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtAuthorName.Text = ds.Tables[0].Rows[0]["author_name"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }
            else
            {               
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not inserted...try again!!!...','Error')", true);
            }

        }

        protected void BindRepeater()
        {
            cmd = new SqlCommand("spGetAuthor", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_UpdateAuthor", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtID.Text);
            cmd.Parameters.AddWithValue("@name", txtAuthorName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Updated successfully','success')", true);
                Clrcontrol();
                BindRepeater();
                Autogenrate();
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
                btnCancel.Visible = false;
            }
            else
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not Updated...try again!!!...','Error')", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}