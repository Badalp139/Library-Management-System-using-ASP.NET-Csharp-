using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace LibraryManagementSystem.Admin
{
    public partial class Add_publisher : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Autogenrate();
                Bindrecord();
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
                btnCancel.Visible = true;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                insertpublisher();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error ! please enter valid data...try again!!!...','Error')", true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_UpdatePublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Updated successfully','success')", true);
                Clrcontrol();
                Bindrecord();
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


        public void Autogenrate()
        {
            int r;
            dbcon.OpenCon();
            cmd = new SqlCommand("select max(publisher_id) as ID from publisher_master_tbl", dbcon.GetCon());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string d = dr[0].ToString();
                if (d == "")
                {
                    txtpublisherID.Text = "501";
                }
                else
                {
                    r = Convert.ToInt32(dr[0].ToString());
                    r = r + 1;
                    txtpublisherID.Text = r.ToString();
                }
                txtpublisherID.ReadOnly = true;



            }
            dbcon.Closecon();

        }

        protected void Bindrecord()
        {
            cmd = new SqlCommand("sp_getpublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RptPublisher.DataSource = dt;
            RptPublisher.DataBind();
        }
        protected void insertpublisher()
        {
            cmd = new SqlCommand("sp_InsertPublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved successfully','success')", true);
                Clrcontrol();
                Bindrecord();
                Autogenrate();
            }
            else
            {
                dbcon.Closecon();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not inserted...try again!!!...','Error')", true);
            }
        }

        private void Clrcontrol()
        {
            txtpublisherName.Text = txtpublisherID.Text = string.Empty;
            txtpublisherID.Focus();
        }
        protected void SearchRecordBy_ID(string idd)
        {
            cmd = new SqlCommand("sp_getpublisherByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idd);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.Closecon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtpublisherID.Text = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtpublisherName.Text = ds.Tables[0].Rows[0]["publisher_name"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not inserted...try again!!!...','Error')", true);
            }
        }

        protected void RptPublisher_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SearchRecordBy_ID(id);
            }
            else if (e.CommandName == "delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                cmd = new SqlCommand("sp_DeletepublisherByID", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Id", id);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    dbcon.Closecon();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Deleted successfully','success')", true);
                    Clrcontrol();
                    Bindrecord();
                    Autogenrate();
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                    //btnCancel.Visible = false;
                }
                else
                {
                    dbcon.Closecon();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error ! Record not Deleted...try again!!!...','Error')", true);
                }
            }
        }
    }
}