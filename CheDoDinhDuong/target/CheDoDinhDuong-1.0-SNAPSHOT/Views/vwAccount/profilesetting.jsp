<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="beans.User"/>


<t:main>

<jsp:attribute name="js">

    <script>
        $('#frmChangePassword').on('submit', function (e) {


            const curpassword= $('#txtCurpassword').val();
            if (curpassword.length === 0) {
                alert('Invalid current password.');
                e.preventDefault();
                return;
            }

            const password= $('#txtNewpassword').val();
            if (password.length === 0) {
                alert('Invalid new password.');
                e.preventDefault();
                return;
            }

            const confirm= $('#txtRenewpassword').val();
            if (confirm.length === 0) {
                alert('Invalid confirm.');
                e.preventDefault();
                return;
            }
            if(password!==confirm){
                e.preventDefault();
                return alert("Password is not match!")

            }



        });


    </script>

</jsp:attribute>

    <jsp:body>
        <!-- PAGE HEADER

        CLASSES:
        .page-header-xs	= 20px margins
        .page-header-md	= 50px margins
        .page-header-lg	= 80px margins
        .page-header-xlg= 130px margins
        .dark			= dark page header

        .shadow-before-1 	= shadow 1 header top
        .shadow-after-1 	= shadow 1 header bottom
        .shadow-before-2 	= shadow 2 header top
        .shadow-after-2 	= shadow 2 header bottom
        .shadow-before-3 	= shadow 3 header top
        .shadow-after-3 	= shadow 3 header bottom
        -->
        <section class="page-header page-header-xs">
            <div class="container">

                <h1>PROFILE</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">Profile</li>
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
                            <img class="img-fluid" src="${pageContext.request.contextPath}/Public/Imgs/Food/1.jpg" alt="" />
                            <h2 class="fs-18 mt-10 mb-0">${authUser.fullName}</h2>
                            <h3 class="fs-11 mt-0 mb-10 text-muted">USER</h3>
                        </div>



                        <!-- SIDE NAV -->
                        <ul class="side-nav list-group mb-60" id="sidebar-nav">
                            <li class="list-group-item "><a href="${pageContext.request.contextPath}/Account/Profile"><i class="fa fa-eye"></i> PROFILE</a></li>
                            <li class="list-group-item active"><a href="${pageContext.request.contextPath}/Account/ProfileSetting"><i class="fa fa-gears"></i> SETTINGS</a></li>

                        </ul>
                        <!-- /SIDE NAV -->


                        <!-- info -->
                        <div class="box-light mb-30">
                            <div class="text-muted">
                                <h2 class="fs-18 text-muted mb-6"><b>About</b> ${authUser.fullName}</h2>
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
                    <div class="col-lg-9 col-md-9 col-sm-8 order-md-2 order-sm-2 mb-80">

                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active"><a class="active" href="#info" data-toggle="tab">Personal Info</a></li>
                            <li><a href="#avatar" data-toggle="tab">Avatar</a></li>
                            <li><a href="#password" data-toggle="tab">Password</a></li>

                        </ul>

                        <div class="tab-content mt-20">

                            <!-- info tab -->
                            <div class="tab-pane active" id="info">
                                <form action="#" method="post" id="frmProfilesetting">
                                    <div class="form-group">
                                        <label class="form-control-label">UserName</label>
                                        <input readonly type="text" name="usernameinfo"  class="form-control" value="${authUser.userName}">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Full Name</label>
                                        <input type="text" name="fullnameinfo"  class="form-control" value="${authUser.fullName}">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Age</label>
                                        <input type="number" name="ageinfo" class="form-control" value="${authUser.age}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Height</label>
                                        <input type="number" step="0.5" min="0" name="heightinfo" value="${authUser.height}" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Weight</label>
                                        <input type="number" step="0.5" min="0" name="weightinfo" value="${authUser.weight}" class="form-control">
                                    </div>


                                    <c:choose>
                                        <c:when test="${authUser.sex == false}">
                                            <div class="form-group">
                                                <label class="form-control-label">Sex</label>
                                                <label class="select mb-10 mt-20">
                                                    <select name="sexinfo">
                                                        <option value="-1"  disabled>Gender</option>
                                                        <option value="0" selected>Male</option>
                                                        <option value="1">Female</option>
                                                    </select>
                                                    <i></i>
                                                </label>
                                            </div>
                                        </c:when>

                                        <c:otherwise>
                                            <div class="form-group">
                                                <label class="form-control-label">Sex</label>
                                                <label class="select mb-10 mt-20">
                                                    <select name="sexinfo" >
                                                        <option value="-1"  disabled>Gender</option>
                                                        <option value="0">Male</option>
                                                        <option value="1" selected>Female</option>
                                                    </select>
                                                    <i></i>
                                                </label>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>



                                    <div class="form-group">
                                        <label class="form-control-label">About</label>
                                        <textarea class="form-control" rows="3" placeholder="About Me..."></textarea>
                                    </div>

                                    <!--2 cai nut -->
                                    <div class="d-flex justify-content-start">
                                        <button type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/Update">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            Save Changes
                                        </button>

                                        <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                            Cancel
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <!-- avatar tab -->
                            <div class="tab-pane fade" id="avatar">

                                <form class="clearfix" action="#" method="post" enctype="multipart/form-data">
                                    <div class="form-group">

                                        <div class="row">

                                            <div class="col-md-3 col-sm-4">

                                                <div class="thumbnail">
                                                    <img  class="img-fluid" src="https://images.unsplash.com/photo-1498462440456-0dba182e775b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80" alt="" />
                                                </div>

                                            </div>

                                            <div class="col-md-9 col-sm-8">

                                                <div class="sky-form m-0">
                                                    <label class="label">Select File</label>
                                                    <label for="file" class="input input-file">
                                                        <div class="button">
                                                            <input type="file" id="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
                                                        </div><input type="text" readonly>
                                                    </label>
                                                </div>

                                                <a href="#" class="btn btn-danger btn-sm rad-0"><i class="fa fa-times"></i> Remove Avatar</a>

                                                <div class="clearfix mt-20">
                                                    <span class="badge badge-warning">NOTE! </span>
                                                    <p>
                                                        Chỉ nhận ảnh file jpg
                                                    </p>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <!--2 cai nut -->
                                    <div class="d-flex justify-content-start">
                                        <button type="submit" class="btn btn-primary" style="margin-right: 10px;">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            Save Changes
                                        </button>

                                        <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                            Cancel
                                        </button>
                                    </div>

                                </form>

                            </div>

                            <!-- password tab -->
                            <div class="tab-pane fade" id="password">

                                <form action="#" method="post" id="frmChangePassword">

                                    <c:if test="${hasError}">
                                        <!-- ALERT -->
                                        <div class="alert alert-mini alert-danger mb-30" role="alert">
                                            <strong>Mat khau hien tai nhap sai</strong> ${errorMessage}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div><!-- /ALERT -->

                                    </c:if>
                                    <div class="form-group">
                                        <label class="form-control-label">Username</label>
                                        <input type="text" name="curusername" id="txtCurusername" readonly class="form-control" value="${authUser.userName}">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Current Password</label>
                                        <input type="password" name="curpassword" class="form-control" id="txtCurpassword">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">New Password</label>
                                        <input type="password" name="newpassword" class="form-control" id="txtNewpassword">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Re-type New Password</label>
                                        <input type="password" name="renewpassword" class="form-control" id="txtRenewpassword">
                                    </div>

                                    <!--2 cai nut -->
                                    <div class="d-flex justify-content-start">
                                        <button type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/ChangePassword">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            Change Password
                                        </button>

                                        <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                            Cancel
                                        </button>
                                    </div>

                                </form>

                            </div>


                        </div>

                    </div>

                </div>
            </div>
        </section>


    </jsp:body>
</t:main>
