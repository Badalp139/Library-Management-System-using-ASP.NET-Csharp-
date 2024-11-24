<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="LibraryManagementSystem.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="Logoimg/logolcon.jpg"/>
     <%--1-Bootstarp css--%>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

 <%-- 2-Datatable css--%>
 <link href="datatable/css/dataTables.dataTables.min.css" rel="stylesheet" />

 <%--3-Fontawesome--%>
 <link href="fontawesome/css/all.css" rel="stylesheet" />

 <%-- 4-Jquery js--%>
 <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script> 

 <%--5-Popper js--%>
 <script src="bootstrap/js/popper.min.js"></script>

 <%--6-Bootstarp js--%>
 <script src="bootstrap/js/bootstrap.min.js"></script>

 <%--7-Sweetalert--%>
 <link href="SweetAlert/Styles/sweetalert.css" rel="stylesheet" />
 <script src="SweetAlert/Scripts/sweetalert.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div>
     <nav class="navbar navbar-expand-sm navbar-dark bg-info">
         <a class="navbar-brand" href="default.aspx">
             <img src="Logoimg/logolcon.jpg" alt="logo" width="49" heightt="49" />LMS Application</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="collapsibleNavbar">
              <ul class="navbar-nav">
                 <li class="nav-item" >
                     <a class="nav-link" href="default.aspx" ><b>Home </b></a>
                 </li>
                  <li class="nav-item" ><a class="nav-link" href="#"><b>Library Collection </b></a></li>
                  <li class="nav-item" ><a class="nav-link" href="#" ><b>Archives </b></a></li>
                  <li class="nav-item" ><a class="nav-link" href="#" ><b>Publication </b></a></li>
                  <li class="nav-item" ><a class="nav-link" href="#" ><b>Gallary </b></a></li>
                  <li class="nav-item" ><a class="nav-link" href="#"><b>Contact Us </b></a></li>
              </ul>
         </div>
        <%-- navnar right icon--%>
         <div class="pmd-navbar-right-icon ml-auto">
            <%-- <a class="btn-btn-sm btn-info" href="#">SignUp</a>--%>
             <a class="btn btn-primary" href="Login.aspx">SignIn</a>

         </div>
     </nav>
     <div class="jumbotron text-center alert alert-info" style="margin-button:0">
         <h1>Library Management System</h1>
         <p>Building community. Inspring readers. Expanding book Acces</p>
     </div>
     <div class="container-fluid">
         <div class="row">
             <div class="col-sm-3 border border-info">
                 <h2>Filter</h2>
                 
                 <p>Top search</p>
                 <ul class="nav nav-pills flex-column">
                      <li class="nav-item">
                          <a class="nav-link active" href="#">Active</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link " href="#">Link</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link " href="#">link</a>
                      </li>
                      <li class="nav-item">
                         <a class="nav-link disabled" href="#">Disabled</a>
                      </li>
                 </ul>
                 <hr class="d-sm-none">
             </div>
             <div class="col-sm-9  border border-info">
                <%--write your code here--%>

                                         <%--Login Screen--%>
                        <div class="container mt-3">
                            <h2>Create New Account</h2>
                            <br>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#signup">Sign Up</a>
                                </li>
                               
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="signup" class="container tab-pane active">
                                    <br>
                                    <h3>Sign Up</h3>
                                    <p></p>
                                    <!---design login form---->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col"> <center><img width="150" src="Logoimg/sign_up.png" </center>
                                                            </div>
                                                        </div>
                                                        <div class="row"> 
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Sign Up</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label>Member ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="MemberID"  runat ="server"></asp:TextBox>  
                                                                </div>

                                                                 <label>Password</label>
                                                                 <div class="form-group">
                                                                   <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"  runat ="server"></asp:TextBox> 
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Valid Password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                 </div>
                                                                 <label>Full Name</label>
                                                                 <div class="form-group">
                                                                   <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name"   runat ="server"></asp:TextBox> 
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Full Name" ControlToValidate="txtFullName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                 </div>                                                                                                                              
                                                                  
                                                               <%-- <div class="form-group">
                                                                    <a href="SignUp.aspx"><input type="button" Class="btn btn-info btn-lg btn-block" value="SignUp" </a>
                                                                </div>--%>
                                                            </div>
                                                            <div class="col-4">
                                                                 <label>Date of Birth</label>
                                                                 <div class="form-group">
                                                                      <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat ="server"></asp:TextBox>  
                                                                 </div>
                                                                 <label>Contact No</label>
                                                                 <div class="form-group">
                                                                      <asp:TextBox ID="txtContactNO" CssClass="form-control" placeholder="Contact No"   runat ="server"></asp:TextBox>  
                                                                 </div>
                                                                 <label>EmailID</label>
                                                                 <div class="form-group">
                                                                     <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email"  runat ="server"></asp:TextBox> 
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter valid email address" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Enter valid email address" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="#FF33CC" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                 </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>State</label>
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
                                                                <label>City</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>Pincode</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPincode" CssClass="form-control" placeholder="Pincode" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>                                                          
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                              <label>Full Address</label>
                                                              <div class="form-group">
                                                                 <asp:TextBox ID="txtFullAddress" CssClass="form-control" placeholder="Full Address" runat ="server"></asp:TextBox>  
                                                              </div>
                                                            </div>                                                             
                                                        </div>
                                                        <div class="row">
                                                              <div class="col-3">
                                                                <div class="form-group">
                                                                  <asp:Button ID="btnSignup" CssClass="btn btn-success btn-lg btn-block"  runat="server" Text="Sign Up" onClick="btnSignup_Click" />
                                                                </div>
                                                             </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href=""><< Back to Home Screen</a>
                                            </div>

                                        </div>
                                    </div>

                                    <!---design end---->

                                </div>
                                
                            </div>
                        </div>


                        <!----End login screen--->


             </div>
         </div>

     </div>
        <br />
     <div class="jumbotron text-center alert-danger" style="margin-bottom:0;border:2px solid red">
        <p>Footer</p>
         <div class="container">
             <div class="row">
                 <div class="col-md-4">
                     <div class="footer-pad">
                         <h4>Heading1</h4>
                         <ul class="list-unstyled">
                             <li><a href="#"></a></li>
                             <li><a href="#">Payment Center</a></li>
                             <li><a href="#">News and updates</a></li>
                         </ul>
                     </div>
                 </div>
                 <div class="col-md-4">
                 <div class="footer-pad">
                 <h4>Heading1</h4>
                    <ul class="list-unstyled">
                          <li><a href="#"></a></li>
                          <li><a href="#">Website</a></li>
                          <li><a href="#">Disclaimer</a></li>
                   </ul>   
               </div>
         </div>
         <div class="col-md-4">
             <h4>Follow us</h4>
             <ul class="Social-network social-circle">
                 <li><a href="#" title="Facebook"><i class="fa fa-facebook">Facebook</i></a></li>
             </ul>
         </div>
     </div>
         <div class="row">
             <div class="col-md-12 fa-copyright border-dark">
                 <p class="text-center">&copy; Copyright 2024 - Badal Library. All rights Reserved</p>
             </div>
         </div>
 </div>
    </form>
</body>
</html>
