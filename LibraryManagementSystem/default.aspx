<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="LibraryManagementSystem._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <!-- indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <!--slideshow-->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Slideimg/lms1.jpg" alt="los angeles"alt="chicago" width="900px" height="575px" />
                    </div>
                    <div class="carousel-item">
                        <img src="Slideimg/lms2.jpg" alt="chicago" width="900px" height="575px" />
                    </div>
                    <div class="carousel-item">
                        <img src="Slideimg/lms3.jpg" alt="New york"  width="900px" height="575px"/>
                    </div>
                </div>

                <!--Left and right control-->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <h2>TITLE HEADING</h2>
                <h5>Title Description,sep 27, 2024</h5>
                <div class="fakeimg">Fake Image</div>
                <p>Some Text...</p>
                <p> suny in culpa qui dreujc kiaie hdte mollit anim in id labrom conuter adipsing elit,sed do thr template</p>
                <br />
                <h2>TITLE HEADING</h2>
                <h5>Title Description,sep 27, 2024</h5>
                <div class="fakeimg">Fake Image</div>
                <p>Some Text...</p>
                <p> suny in culpa qui dreujc kiaie hdte mollit anim in id labrom conuter adipsing elit,sed do thr template</p>
            </div>      
        </div>

        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div clss="panel panel-info">
                            <div class="panel-heading">BLACK FRIDAY DEAL</div>
                            <div class="card-body">
                                <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="imgage" />
                            </div>
                            <div class="panel-footer">Buy 50 mobiles and get a gift</div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                       <div clss="panel panel-info">
                         <div class="panel-heading">BLACK FRIDAY DEAL</div>
                         <div class="card-body">
                              <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="image" />
                         </div>
                         <div class="panel-footer">Buy 50 mobiles and get a gift</div>
                      </div>
                   </div>
                    <div class="col-sm-4">
                       <div clss="panel panel-info">
                         <div class="panel-heading">BLACK FRIDAY DEAL</div>
                         <div class="card-body">
                            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="image" />
                         </div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift</div>
                     </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
