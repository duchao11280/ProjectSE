<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<beans.Category>"/>
<jsp:useBean id="searchfoods" scope="request" type="java.util.List<beans.Food>"/>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-sm-3">
                <div class="card mb-3">
                    <div class="card-header">
                        <h4>Categories</h4>
                    </div>
                    <div class="list-group list-group-flush">
                        <c:forEach var="c" items="${categoriesWithDetails}">
                            <a href="${pageContext.request.contextPath}/Food/ByCat?id=${c.catID}" class="list-group-item list-group-item-action">
                                <i class="fa fa-caret-right" aria-hidden="true"></i>
                                    ${c.catName}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Foods</h4>
                    </div>
                    <c:choose>
                    <c:when test="${searchfoods.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach var="c" items="${searchfoods}">
                                <div class="col-sm-4 mb-3">
                                    <div class="card">
                                        <img src="${pageContext.request.contextPath}/Public/Imgs/Food/14.jpg" alt="${c.foodID}" title="${c.foodName}" class="card-img-top"/>
                                        <div class="card-body">
                                            <h6 class="card-title">${c.foodName}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${c.kcal}" type="number"/> Kcal
                                            </h5>
                                            <p class="card-text">Protein Lipit Glucozo</p>
                                        </div>
                                        <div class="card-footer bg-yellow">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Food/Detail?id=${c.foodID}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>