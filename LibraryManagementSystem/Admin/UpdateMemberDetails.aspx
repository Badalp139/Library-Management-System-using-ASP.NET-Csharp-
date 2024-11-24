﻿<%@ Page Title="Member Update" Language="C#" MasterPageFile="~/Admin/Adminsite2.Master" AutoEventWireup="true" CodeBehind="UpdateMemberDetails.aspx.cs" Inherits="LibraryManagementSystem.Admin.UpdateMemberDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--7-Sweetalert--%>
    <link href="../SweetAlert/Styles/sweetalert.css" rel="stylesheet" />
    <script src="../SweetAlert/Scripts/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4 border">
                <p></p>
                <div claas="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="MemberID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Member ID" ControlToValidate="txtMemberID" ForeColor="Red" ValidationGroup="btnsearch"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <asp:Button ID="btnSearchMember" CssClass="btn btn-primary" runat="server" Text="Search" ValidationGroup="btnsearch" OnClick="btnSearchMember_Click" />
                            <asp:Button ID="btnActiveMember" CssClass="btn btn-success" runat="server" Text="Active" ValidationGroup="btnsearch" OnClick="btnActiveMember_Click" />
                            <asp:Button ID="btnPendingMember" CssClass="btn btn-info" runat="server" Text="Pending" BackColor="Yellow" ForeColor="Black" ValidationGroup="btnsearch" OnClick="btnPendingMember_Click" />
                            <asp:Button ID="btnDeactiveMember" CssClass="btn btn-danger" runat="server" Text="Deactive" BackColor="Red" ForeColor="white" ValidationGroup="btnsearch" OnClick="btnDeactiveMember_Click" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtContactNO" CssClass="form-control" placeholder="Contact No" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Select Your City" Value="Select Your City" />
                                <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                <asp:ListItem Text="Assam" Value="Assam" />
                                <asp:ListItem Text="Bihar" Value="Bihar" />
                                <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                <asp:ListItem Text="Goa" Value="Goa" />
                                <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                <asp:ListItem Text="Haryana" Value="Haryana" />
                                <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                <asp:ListItem Text="Kerala" Value="Kerala" />
                                <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                <asp:ListItem Text="Manipur" Value="Manipur" />
                                <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                <asp:ListItem Text="Odisha" Value="Odisha" />
                                <asp:ListItem Text="Punjab" Value="Punjab" />
                                <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                <asp:ListItem Text="Telangana" Value="Telangana" />
                                <asp:ListItem Text="Tripura" Value="Tripura" />
                                <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
                                <asp:ListItem Text="Delhi" Value="Delhi" />
                                <asp:ListItem Text="Puducherry" Value="Puducherry" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtPincode" CssClass="form-control" placeholder="Pincode" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtFullAddress" CssClass="form-control" placeholder="Full Address" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-sm-12">
                <h4>Members List</h4>
                <div class="table table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table table-sm" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" PageSize="5" OnRowDataBound="GridView1_RowDataBound">
                        <HeaderStyle BackColor="#0066FF" Font-Bold="true" ForeColor="White" />
                        <FooterStyle BackColor="#3366CC" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayID" runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayName" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditName" CssClass="" Text='<%# Eval("full_name") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplaydob" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditDOB" CssClass="" Text='<%# Eval("dob") %>' TextMode="Date" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayContact" runat="server" Text='<%# Eval("Contact_no") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditContact" CssClass="" Text='<%# Eval("Contact_no") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditEmail" CssClass="" Text='<%# Eval("email") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayState" runat="server" Text='<%# Eval("state") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlEditState" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Your City" Value="Select Your City" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                        <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
                                        <asp:ListItem Text="Delhi" Value="Delhi" />
                                        <asp:ListItem Text="Puducherry" Value="Puducherry" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="city">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplaycity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditcity" CssClass="" Text='<%# Eval("city") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Pincode">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayPincode" runat="server" Text='<%# Eval("pincode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditPincode" CssClass="" Text='<%# Eval("pincode") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayAddress" runat="server" Text='<%# Eval("full_address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditAddress" CssClass="" Text='<%# Eval("full_address") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="account_status" HeaderText="Status" ReadOnly="true" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" ToolTip="edit record" CommandName="Edit">
                           <span class="fa-stack">
                             <i class="fa fa-square fa-stack-2x"></i>
                             <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                           </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" Text="Delete" CommandName="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row ?');">
                           <span class="fa-stack">
                              <i class="fa fa-square fa-stack-2x"></i>
                              <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                           </span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" class="table-link text-success" runat="server" Text="Update" CommandName="Update" ToolTip="Update record">
                           <span class="fa-stack">
                              <i class="fa fa-square fa-stack-2x"></i>
                              <i class="fa fa-spinner fa-stack-1x fa-inverse"></i>
                           </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" class="table-link text-danger" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Delete record">
                          <span class="fa-stack">
                              <i class="fa fa-square fa-stack-2x"></i>
                              <i class="fa fa-times-circle fa-stack-1x fa-inverse"></i>
                          </span>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>