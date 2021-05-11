<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:attribute name="css">
        <!--Datetimepicker-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!--End Datetimepicker-->
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
        <script>
            $(function() {
                $('#dtpkCustomMenu').datetimepicker();
            });
        </script>
    </jsp:attribute>

    <jsp:body>

        <div class="container">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>XÂY DỰNG THỰC ĐƠN CHO BẠN</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <table class="table">
                    <thead>
                    <tr>
                        <td>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01">Categories</label>
                                </div>
                                <select class="custom-select category" id="inputGroupSelect01">
                                    <option disabled value="-1" selected>Choose...</option>
                                    <c:forEach var="c" items="${categoriesforcal}">
                                        <option value="${c.getCatID()}">${c.getCatName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputSelectFood">Foods</label>
                                </div>
                                <select class="custom-select foodscal" id="inputSelectFood">
                                    <option value="-1" selected>Choose...</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    </thead>
                </table>
                <div class="form-group">

                    <div class='mb-3 input-group date' id='dtpkCustomMenu'>
                        Date: &nbsp;
                        <input type='text' class="form-control" name="dtpkCustomMenu"/>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>

</t:main>
