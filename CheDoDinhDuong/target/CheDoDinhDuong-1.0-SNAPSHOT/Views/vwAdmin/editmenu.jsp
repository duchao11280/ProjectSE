<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
        <form method="post">
            <div class="container mt-50">
                <div class="row m-50">
                    <div class="col">
                        <div class="text-center">
                            <h2>QUẢN LÝ THỰC ĐƠN</h2>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="condition" class="col-sm-2 col-form-label bold">Tình trạng:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="condition" name="condition"
                               readonly value="${conditionName}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="day" class="col-sm-2 col-form-label bold">Ngày:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="day" name="day"
                               readonly value="${day}">
                    </div>
                </div>
                <div class="row">
                    <button type="button" class="btn btn-outline-dark ml-5" data-toggle="modal"
                            data-target="#myModal">Thêm món ăn
                        <i class="fa fa-plus" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Bữa sáng
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 1}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Bữa trưa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 2}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Bữa phụ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 3}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}>
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Bữa tối</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 4}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
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
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm nguyên liệu</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="con" class="col-sm-4 col-form-label">Tính trạng:</label>
                                <div class="col-sm">
                                    <input  class="form-control" id="con" name="con" readonly value="${conditionName}">
                                </div>
                            </div>
                            <div class="form-group row ml-1 mr-1">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="session">Thời gian:</label>
                                    </div>
                                    <select class="custom-select" id="session" name="session">
                                        <option value="1">Bữa sáng</option>
                                        <option value="2">Bữa trưa</option>
                                        <option value="3">Bữa phụ</option>
                                        <option value="4">Bữa tối</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="food" class="col-sm-4 col-form-label">Món ăn: </label>
                                <div class="col-sm">
                                    <input  class="form-control" id="food" name="food">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="number" class="col-sm-4 col-form-label">Số lượng: </label>
                                <div class="col-sm">
                                    <input type="number" class="form-control" id="number" name="number" step="1">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btnAddMenu" type="submit"
                                        formaction="${pageContext.request.contextPath}/Admin/AddMenu?conid=${conid}&day=${day}"
                                        class="btn btn-default">Thêm
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <script>
            $('#btnAddMenu').click(function (e) {
                if($('#food').val().length == 0){
                    alert("Bạn chưa nhập món ăn");
                    e.preventDefault();
                    return;
                }
                if($('#number').val().length == 0){
                    alert("Bạn chưa nhập số lượng");
                    e.preventDefault();
                    return;
                }
            })
            $('.btndelete').click(function (e) {
                if (confirm('Bạn có chắc chắn xóa?')) {

                } else {
                    e.preventDefault();
                }
            })
        </script>
    </jsp:body>
</t:main>