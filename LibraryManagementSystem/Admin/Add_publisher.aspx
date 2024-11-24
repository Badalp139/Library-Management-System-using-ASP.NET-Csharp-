<%@ Page Title="Add_publisher" Language="C#" MasterPageFile="Adminsite2.Master" AutoEventWireup="true" CodeBehind="Add_publisher.aspx.cs" Inherits="LibraryManagementSystem.Admin.Add_publisher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-4 border">
                <div class="row">
                    <div class="col-12">
                        <h4>Add Publisher</h4>
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherID" CssClass="form-control" placeholder="Publisher ID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Enter Publisher Id" ValidationGroup="btn_save" Display="Dynamic"  ControlToValidate="txtpublisherID"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherName" CssClass="form-control" placeholder="Publisher Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Enter Publisher Name" ValidationGroup="btn_save" Display="Dynamic"  ControlToValidate="txtpublisherName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add" ValidationGroup="btn_save" OnClick="btnAdd_Click" />
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 border">
                <div class="table table-responsive">
                    <h4>Show all Publisher List:</h4>
                    <asp:Repeater ID="RptPublisher" runat="server" OnItemCommand="RptPublisher_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover ">
                                <thead class="alert-info">
                                    <tr>
                                        <th><span>Publisher ID</span></th>
                                        <th><span>Publisher Name</span></th>
                                        <th>&nbsp</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("publisher_id") %></td>
                                <td><%#Eval("publisher_name") %></td>
                                <td style="width: 18%">
                                    <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" CommandArgument='<%#Eval("publisher_id") %>' CommandName="edit" ToolTip="edit record">
                 <span class="fa-stack">
                    <i class="fa fa-square fa-stack-2x"></i>
                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                 </span>
                                    </asp:LinkButton>


                                    <asp:LinkButton ID="linkDelete" class="table-link text-danger" runat="server" CommandArgument='<%#Eval("publisher_id") %>' CommandName="delete" Text="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row ?');">
                   <span class="fa-stack">
                    <i class="fa fa-square fa-stack-2x"></i>
                    <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                  </span>
                                    </asp:LinkButton>

                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                        </table>                   
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
