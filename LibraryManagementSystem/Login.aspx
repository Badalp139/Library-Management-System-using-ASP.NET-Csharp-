<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="Logoimg/logolcon.jpg" />
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
                        <li class="nav-item">
                            <a class="nav-link" href="default.aspx"><b>Home </b></a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Library Collection </b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Archives </b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Publication </b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Gallary </b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Contact Us </b></a></li>
                    </ul>
                </div>
                <%-- navnar right icon--%>
                <div class="pmd-navbar-right-icon ml-auto">
                    <a class="btn btn-primary" href="SignUp.aspx">SignUp</a>
                    <%-- <a class="btn-btn-sm btn-info" href="#">Sign In</a>--%>
                </div>
            </nav>
            <div class="jumbotron text-center alert alert-info" style="margin-button: 0">
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
                        <%--Login Screen--%>
                        <div class="container mt-3">
                            <h2>Login Panel</h2>
                            <br>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home">User Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu1">Admin Login</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home" class="container tab-pane active">
                                    <br>
                                    <h3>User Login</h3>
                                    <p></p>
                                    <!---design login form---->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col"> <center><img width="150" src="Logoimg/user.png" </center>
                                                            </div>
                                                        </div>
                                                        <div class="row"> 
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Member ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="MemberID"  runat ="server"></asp:TextBox>  
                                                                </div>

                                                                 <label>Password</label>
                                                                 <div class="form-group">
                                                                   <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"  runat ="server"></asp:TextBox>  
                                                                 </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-lg btn-block"  runat="server" Text="Login" OnClick="btnLogin_Click" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <a href="SignUp.aspx"><input type="button" Class="btn btn-info btn-lg btn-block" value="SignUp" </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="#"><< Back to Home Screen</a>
                                            </div>

                                        </div>
                                    </div>

                                    <!---design end---->

                                </div>
                                <div id="menu1" class="container tab-pane fade">
                                    <br>
                                    <h3>Admin Login</h3>
                                    <p></p>
                                    <!--- Admin design login form---->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center><img width="150" src="Logoimg/admin.png"</center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Admin Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Admin ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminid" CssClass="form-control" placeholder="AdminID" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnAdminLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Admin Login" OnClick="btnAdminLogin_Click" />
                                                                </div>
                                                                <div class="form-group"><a href="SignUp.aspx"><input type="button" Class="btn btn-info btn-lg btn-block" value="SignUp" </a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href=""><< Back to Home Screen</a>
                                            </div>

                                        </div>
                                    </div>

                              <!---Admin design end---->
                                </div>

                            </div>
                        </div>


                        <!----End login screen--->
                    </div>
                </div>

            </div>

            <br />
            <div class="jumbotron text-center alert-danger" style="margin-bottom: 0; border: 2px solid red">
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
