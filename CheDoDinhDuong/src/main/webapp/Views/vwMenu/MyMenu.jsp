<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                <c:forEach var="c" items="${lstDate}">
                    <div class="row ">
                        <div class="col">
                            <div class="card">
                                <div class="card-header text-center">
                                    ${c.getDatetime().getDate()} - ${c.getDatetime().getMonth()+1} - ${c.getDatetime().getYear()+1900}
                                </div>
                                <div class="card-body">
                                    <c:forEach var="d" items="${lstDate2loop}">
                                        <c:choose>
                                            <c:when test="${d.getDatetime().getDate() == c.getDatetime().getDate() }">
                                                <div class="card mb-3" >
                                                    <div class="row no-gutters">
                                                        <div class="col-md-3 d-flex align-items-center justify-content-center" style="background-color: #00AFF0">
                                                               <fmt:formatDate type = "time"  value="${d.getDatetime()}" />
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="card-body">
                                                                <c:forEach var="e" items="${lstCusMenu}">
                                                                    <c:choose>
                                                                        <c:when test="${e.getDatetime() == d.getDatetime() }">
                                                                            <p class="card-text"><h5>${e.getNumber()}&nbsp;${e.getFoodNamebyFoodID()}</h5></p>
                                                                        </c:when>
                                                                        <c:otherwise></c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>



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