<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<t:main>
    <jsp:body>

        <section class="page-header page-header-xs">
            <div class="container">
                <h1>ADMIN PAGE</h1>
                <ol class="breadcrumb">
                    <li><a href="">Admin page</a></li>
                    <li><a href="">Feedback</a></li>
                    <li class="active">User</li>
                </ol>
            </div>
        </section>
        <form method="post">
            <div class="container">
                <div class="row m-30">
                    <div class="col">
                        <div class="text-center">
                            <h2 class="tt">USER'S FEEDBACK</h2>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-12">
                        <form method="post">
                            <c:forEach var="c" items="${lstFeedback}">

                                <div class="card">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-md-11">
                                                    ${c.getTitle()}
                                            </div>
                                            <div class="form-group">
                                                <input name="idfeed" style="display: none" type="number"
                                                        value="${c.getId()}"/>

                                            </div>
                                            <div>
                                                <button type="submit" class="btn btn-primary"
                                                        style="margin-right: 10px;">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p>${c.getContent()}.</p>
                                            <footer class="blockquote-footer">${c.getUsername()}</footer>
                                        </blockquote>
                                    </div>
                                </div>


                            </c:forEach>
                        </form>

                    </div>

                </div>


            </div>
        </form>

    </jsp:body>
</t:main>