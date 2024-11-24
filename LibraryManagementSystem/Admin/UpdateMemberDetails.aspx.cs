using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LibraryManagementSystem.Admin
{
    public partial class UpdateMemberDetails : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                BindGridView();
                
            }
        }

        private void BindGridView()
        {
            cmd = new SqlCommand("sp_getMember_AllRecords", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            GridView1.DataSource =dbcon.load_Data(cmd);
            GridView1.DataBind();
        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                Search_memberRecord();
            }
            
        }

        private void Search_memberRecord()
        {
            cmd = new SqlCommand("sp_getMemberByID", dbcon.GetCon());
            cmd.CommandType =CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",txtMemberID.Text.Trim());
            dbcon.OpenCon();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    txtFullName.Text = dr.GetValue(0).ToString();
                    txtDOB.Text= dr.GetValue(1).ToString();
                    txtContactNO.Text= dr.GetValue(2).ToString();
                    txtEmail.Text= dr.GetValue(3).ToString();
                    ddlState.SelectedValue= dr.GetValue(4).ToString();
                    txtCity.Text= dr.GetValue(5).ToString();
                    txtPincode.Text= dr.GetValue(6).ToString();
                    txtFullAddress.Text= dr.GetValue(7).ToString();
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record not Found...try again','Error')", true);
            }
            dbcon.Closecon();

        }

        protected void btnActiveMember_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                UpdateMemberStatus_ByID("Active");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation error....try again','Error')", true);
            }
        }

        private void UpdateMemberStatus_ByID(string varStatus)
        {
            if(CheckMemberExist_OR_Not())
            {
                cmd = new SqlCommand("sp_UpdateMemberStatus_ByID", dbcon.GetCon());
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@qrType", varStatus);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Member status updated','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record not Updated...try again','Error')", true);
                }
                dbcon.Closecon();
                BindGridView();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record not Found...try again','Error')", true);
            }
        }

        private bool CheckMemberExist_OR_Not()
        {
            dbcon.OpenCon();
            cmd = new SqlCommand("sp_getMemberByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dbcon.Closecon();
            if (dt.Rows.Count >= 1)
                return true;
            else
                return false;
        }

        protected void btnPendingMember_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMemberStatus_ByID("pending");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error...try again','Error')", true);
            }

        }

        protected void btnDeactiveMember_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMemberStatus_ByID("Deactive");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error...try again','Error')", true);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);

            TextBox updatetxtName= (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditName");
            TextBox updatetxtdob = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditDOB");
            TextBox updatetxtcontact = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditContact");
            TextBox updatetxtemail= (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
            DropDownList updateddlstate = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlEditState");
            TextBox updatetxtcity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditcity");
            TextBox updatetxtpincode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditPincode");
            TextBox updatetxtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");


            cmd = new SqlCommand("sp_UpdateMember_AllRecords", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@full_name",updatetxtName.Text);
            cmd.Parameters.AddWithValue("@dob", updatetxtdob.Text);
            cmd.Parameters.AddWithValue("@contact_no", updatetxtcontact.Text);
            cmd.Parameters.AddWithValue("@email", updatetxtemail.Text);
            cmd.Parameters.AddWithValue("@state", updateddlstate.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city", updatetxtcity.Text);
            cmd.Parameters.AddWithValue("@pincode", updatetxtpincode.Text);
            cmd.Parameters.AddWithValue("@full_address", updatetxtAddress.Text);

            cmd.Parameters.AddWithValue("@member_id", ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.Closecon();
            GridView1.EditIndex = -1;
            BindGridView();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);
            cmd = new SqlCommand("sp_DeleteMemberByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            
            cmd.Parameters.AddWithValue("@member_id", ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.Closecon();
            BindGridView();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
                DropDownList ddlEditState_value = (DropDownList) e.Row.FindControl("ddlEditState");
                Label lblstat = (Label)e.Row.FindControl("lblEditState");
                ddlEditState_value.SelectedValue = lblstat.Text;
            }
        }
    }
}