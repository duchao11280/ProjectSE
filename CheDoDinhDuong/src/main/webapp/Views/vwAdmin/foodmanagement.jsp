<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<t:main>
    <jsp:body>
        <style>
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
        <form method="post">
            <div class="container">
                <div class="row m-30">
                    <div class="col">
                        <div class="text-center">
                            <h2 class="tt">QUẢN LÝ MÓN ĂN</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <button type="button" class="btn btn-secondary mb-30" data-toggle="modal" data-target="#myModal">
                        <i class="fa fa-plus-square-o" aria-hidden="true"></i>
                        Thêm món mới
                    </button>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm món ăn mới</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label for="foodname" class="col-sm-4 col-form-label">Tên món ăn</label>
                                    <div class="col-sm">
                                        <input type="text" class="form-control" id="foodname" name="foodname">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="catname" class="col-sm-4 col-form-label">Thể loại</label>
                                    <div class="col-sm">
                                        <select class="form-control" id="catname" name="catname">
                                            <c:forEach var="c" items="${lstCat}">
                                                <option>${c.getCatName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="glucozo" class="col-sm-2 col-form-label">Glucozo</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="glucozo" name="glucozo" value="0"
                                               step="0.01">
                                    </div>
                                    <label for="kcal" class="col-sm-2 col-form-label text-right">Calo</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="kcal" name="kcal" value="0"
                                               step="0.01">
                                    </div>
                                    <label for="lipit" class="col-sm-2 col-form-label text-right">Lipt</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="lipit" name="lipit" value="0"
                                               step="0.01">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="protein" class="col-sm-2 col-form-label">Protein</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="protein" name="protein" value="0"
                                               step="0.01">
                                    </div>
                                    <label for="vitaminA" class="col-sm-2 col-form-label text-right">VitaminA</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="vitaminA" name="vitaminA"
                                               value="0" step="0.01">
                                    </div>
                                    <label for="vitaminB" class="col-sm-2 col-form-label text-right">VitaminB</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="VitaminB" name="vitaminB"
                                               value="0" step="0.01">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="vitaminC" class="col-sm-2 col-form-label">VitaminC</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="vitaminC" name="vitaminC"
                                               value="0" step="0.01">
                                    </div>
                                    <label for="vitaminD" class="col-sm-2 col-form-label text-right">VitaminD</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="vitaminD" name="vitaminD"
                                               value="0" step="0.01">
                                    </div>
                                    <label for="vitaminE" class="col-sm-2 col-form-label text-right">VitaminE</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="VitaminE" name="vitaminE"
                                               value="0" step="0.01">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="kali" class="col-sm-2 col-form-label">Kali</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="kali" name="kali" value="0"
                                               step="0.01">
                                    </div>
                                    <label for="fe" class="col-sm-2 col-form-label text-right">Sắt</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="fe" name="fe" value="0"
                                               step="0.01">
                                    </div>
                                    <label for="natri" class="col-sm-2 col-form-label text-right">Natri</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="natri" name="natri" value="0"
                                               step="0.01">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="urlimg" class="col-sm-4 col-form-label">Image url</label>
                                    <div class="col-sm">
                                        <input type="text" class="form-control" id="urlimg" name="urlimg" value="url">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" formaction="${pageContext.request.contextPath}/Admin/AddFood"
                                        class="btn btn-default">Thêm
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row mb-50" style="overflow: auto; height: 550px">
                    <table class="table mb-0">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Thức ăn</th>
                            <th scope="col">Thể loại</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="f" items="${lstFood}">
                            <c:if test="${f.isDelete()==false}">
                                <tr>
                                    <th scope="row">${f.getFoodID()}</th>
                                    <td>${f.getFoodName()}</td>
                                    <td>${f.getCatName()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Admin/EditFood?id=${f.getFoodID()}"
                                           class="btn btn-outline-primary pr-4">
                                            <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                                        <button type="submit" class="btn btn-outline-danger pr-6"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteFood?id=${f.getFoodID()}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.css">
    </jsp:body>
</t:main>