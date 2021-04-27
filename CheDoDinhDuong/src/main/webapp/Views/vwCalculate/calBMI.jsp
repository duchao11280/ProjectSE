<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>


    <jsp:attribute name="js">

    <script>
        $('#frmRegister').on('submit', function (e) {
            e.preventDefault();

            const username = $('#txtUsername').val();
            if (username.length === 0) {
                alert('Invalid username.');
                return;
            }

            const password= $('#txtPassword').val();
            if (password.length === 0) {
                alert('Invalid password.');
                return;
            }
            const fullname= $('#txtFullname').val();
            if (password.length === 0) {
                alert('Invalid Full name.');
                return;
            }
            const age= $('#txtAge').val();
            if (password.length === 0) {
                alert('Invalid Age.');
                return;
            }

            const confirm= $('#txtConfirm').val();
            if (confirm.length === 0) {
                alert('Invalid confirm.');
                return;
            }
            if(password!==confirm){
                return alert("Password is not match!")
            }


            $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + username, function (data) {
                if (data === true ) {
                    $('#frmRegister').off('submit').submit();
                } else {
                    alert('Not available.');
                    return false;
                }
            });
        });


        $('#txtUsername').select();
    </script>

</jsp:attribute>


    <jsp:body>

        <section class="page-header page-header-xs">
            <div class="container">

                <h1>BMI & Calo Calculation</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">BMI & Calo Calculation</li>
                </ol>

            </div>
        </section>
        <!-- /PAGE HEADER -->



        <section>
            <div class="container">

                <div id="portfolio" class="portfolio-gutter">

                    <ul class="nav nav-pills mix-filter mb-60">
                        <li data-filter="all" class="filter active"><a href="${pageContext.request.contextPath}/Calculate/All">All</a></li>
                        <li data-filter="bmi" class="filter active  "><a href="${pageContext.request.contextPath}/Calculate/BMI">BMI Calculation</a></li>
                        <li data-filter="calo" class="filter  "><a href="${pageContext.request.contextPath}/Calculate/CALO">Calo Calculation</a></li>

                    </ul>




                </div>

<%--               cal bmi--%>
                    <div class="container">

                        <div class="row">

                            <!-- LEFT TEXT -->
                            <div class="col-md-5 offset-md-1">

                                <h2 class="fs-16">IMPORTANT INFORMATION</h2>
                                <p class="text-muted">BMI là chỉ số khối cơ thể (viết tắt: Body Mass Index), được các bác sĩ và chuyên gia sức khỏe dùng để
                                    xác định một người nào đó có bị béo phì, thừa cân hay quá gầy không. Thông thường người ta dùng chỉ số này để tính toán
                                    mức độ béo phì.</p>
                                <p class="text-muted">Công thức tính BMI: = Cân nặng (kg) / (Chiều cao (m) x Chiều cao (m)).</p>

                            </div>
                            <!-- /LEFT TEXT -->


                            <!-- calculate -->
                            <div class="col-md-4">

                                <h2 class="fs-16">CALCULATE</h2>

                                <!-- calbmi form -->
                                <form id="frmCalBmi" method="post" action="#" autocomplete="off">
                                    <div class="clearfix">

                                        <!-- height -->
                                        <div class="form-group">
                                            <input type="text" name="heightbmi" class="form-control" placeholder="Height" required="">
                                        </div>

                                        <!-- weight -->
                                        <div class="form-group">
                                            <input type="text" name="weightbmi" class="form-control" placeholder="Weight" required="">
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-6">



                                        </div>

                                        <div class="col-md-12 col-sm-6 col-xs-6 text-left">

                                            <button class="btn btn-primary">Get Result</button>

                                        </div>

                                    </div>

                                </form>



                                <div class="alert alert-mini alert-danger mb-30">
                                    <strong>Oh snap!</strong> bit!
                                </div>

                            </div>


                        </div>


                    </div>


            </div>
        </section>
        <!-- / -->



    </jsp:body>
</t:main>

