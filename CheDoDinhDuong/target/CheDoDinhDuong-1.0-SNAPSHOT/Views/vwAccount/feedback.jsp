<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="authUser" scope="session" type="beans.User"/>


<t:main>


    <jsp:body>

        <section class="page-header page-header-xs">
            <div class="container">

                <h1>FEEDBACK</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">Feedback</li>
                </ol>

            </div>
        </section>
        <!-- /PAGE HEADER -->


        <section>
            <div class="container">
                <div class="row">

                    <!-- LEFT -->
                    <div class="col-lg-3 col-md-3 col-sm-4">

                        <div class="thumbnail text-center">
                            <img  class="img-fluid" src="${pageContext.request.contextPath}${authUser.getUrlImage()}" alt="" />
                            <h2 class="fs-18 mt-10 mb-0">${authUser.getFullName()}</h2>
                            <h3 class="fs-11 mt-0 mb-10 text-muted">USER</h3>
                        </div>



                        <!-- SIDE NAV -->
                        <ul class="side-nav list-group mb-60" id="sidebar-nav">
                            <li class="list-group-item "><a href="${pageContext.request.contextPath}/Account/Profile"><i class="fa fa-eye"></i> PROFILE</a></li>
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/ProfileSetting"><i class="fa fa-gears"></i> SETTINGS</a></li>
                            <li class="list-group-item " ><a href="${pageContext.request.contextPath}/Account/History"><i class="fa fa-user"></i> HISTORY </a></li>
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/MyMenu"><i class="fa fa-book"></i> MY MENU</a></li>

                        </ul>
                        <!-- /SIDE NAV -->


                        <!-- info -->
                        <div class="box-light mb-30">
                            <div class="text-muted">
                                <h2 class="fs-18 text-muted mb-6"><b>About</b> ${authUser.getFullName()}</h2>
                                <p>This is your personal information. You can change your info.</p>

                                <ul class="list-unstyled m-0">
                                    <li class="mb-10"><i class="fa fa-globe fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.google.com">www.google.com</a></li>
                                    <li class="mb-10"><i class="fa fa-facebook fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.facebook.com/">google</a></li>
                                    <li class="mb-10"><i class="fa fa-twitter fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.twitter.com/">@google</a></li>
                                </ul>
                            </div>

                        </div>

                    </div>


                    <!-- RIGHT -->
                    <div class="col-lg-9 col-md-9 col-sm-8">

                        <div class="box-light">

                            <div class="row">

                                <!-- PROFILE -->
                                <div class="col-md-12">

                                    <div class="box-inner">
                                        <h3>
                                            <a class="float-right fs-11 text-warning" href="#">VIEW ALL</a>
                                            FEEDBACK
                                        </h3>

                                        <form method="post">


                                            <div class="form-group">
                                                <label class="form-control-label">Title</label>
                                                <input  type="text" name="title"  class="form-control" >
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Content</label>
                                                <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="4"></textarea>
                                            </div>


                                            <div class="d-flex justify-content-start">
                                                <button type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/Send">
                                                    <i class="fa fa-check" aria-hidden="true"></i>
                                                    Send
                                                </button>

                                            </div>

                                        </form>





                                    </div>


                                </div>
                                <!-- /PROFILE -->

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </section>


    </jsp:body>
</t:main>

