<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
            <h3>Calculate calories in the meal</h3>
            <table class="table">
                <thead>
                <tr>
                    <td>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Categories</label>
                            </div>
                            <select class="custom-select category" id="inputGroupSelect01">
                                <option value="-1" selected>Choose...</option>
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
                                <c:forEach var="d" items="${foodsCal}">
                                    <option value="${d.getFoodID()}">${d.getFoodName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                </thead>
            </table>
        </div>
    </jsp:body>

</t:main>