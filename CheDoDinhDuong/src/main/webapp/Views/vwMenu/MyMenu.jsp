<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>My Menu</h2>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${lstCusMenu.size() == 0}">
                    <div class="row ">
                        <div class="col">
                            <p class="card-text">Không có thực đơn của riêng mình.</p>
                        </div>
                    </div>
                </c:when>
            <c:otherwise>
                <c:forEach var="c" items="${lstCusMenu}">
                    <div class="row ">
                        <div class="col">
                            <div class="card">
                                <div class="card-header text-center">
                                    ${c.getDatetime().getDate()} - ${c.getDatetime().getMonth()+1} - ${c.getDatetime().getYear()+1900}
                                </div>
                                <div class="card-body">
                                    <div class="card mb-3" >
                                        <div class="row no-gutters">
                                            <div class="col-md-3 d-flex align-items-center justify-content-center">
                                                    ${c.getDatetime().getHours()}:${c.getDatetime().getMinutes()}
                                            </div>
                                            <div class="col-md-9">
                                                <div class="card-body">

                                                    <p class="card-text"><h5>${c.getNumber()}&nbsp;${c.getFoodID()}</h5></p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
            </c:choose>


        </div>
    </jsp:body>
</t:main>