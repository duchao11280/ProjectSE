
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="authUser" scope="session" type="beans.User"/>


<t:main>


    <jsp:body>

        <div class="container">
            <div class="accordion" id="accordionExample">
                <c:forEach var="c" items="${lstNutrients}">
                    <div class="card">
                        <div class="card-header" id="${c.getNutritionName()}">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left " type="button" data-toggle="collapse" data-target="#${c.getNutritionID()}" aria-expanded="true" aria-controls="${c.getNutritionName()}">
                                        ${c.getNutritionName()}
                                </button>
                            </h2>
                        </div>
                        <div id="${c.getNutritionID()}" class="collapse show" aria-labelledby="${c.getNutritionName()}" data-parent="#accordionExample">
                            <div class="card-body">
                                <p>Nguồn: ${c.getSource()}</p>
                                <p>Lợi ích: ${c.getBenefit()}</p>
                                <p>Lời khuyên: ${c.getAdvice()}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>

    </jsp:body>

</t:main>

