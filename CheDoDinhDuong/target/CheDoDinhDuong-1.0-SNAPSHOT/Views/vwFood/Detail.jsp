<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="food" scope="request" type="beans.Food"/>

<t:main>
    <jsp:body>
        <div class="card">
            <div class="card-header">
                <h4>${food.foodName}</h4>
            </div>
            <div class="card-body">
                <img alt="${food.foodName}" title="${food.foodName}" src="${pageContext.request.contextPath}/public/imgs/sp/${food.foodID}/main.jpg">
                <p class="card-text mt-3">
                    Kcal:
                    <span class="text-danger font-weight-bold">
            <fmt:formatNumber value="${food.kcal}" type="number"/>
          </span>
                </p>
                <p class="card-text">Protein: ${food.protein}</p>

            </div>
        </div>
    </jsp:body>
</t:main>