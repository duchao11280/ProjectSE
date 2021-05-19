<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:body>
        <section class="page-header page-header-xs">
            <div class="container">
                <h1>ADMIN PAGE</h1>
                <ol class="breadcrumb">
                    <li class="active">Admin page</li>
                    <li><a href="${pageContext.request.contextPath}/Admin/FoodManagement">Food</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1">Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/UserManagement">User</a></li>
                </ol>
            </div>
        </section>
        <div class="container mt-50" style="height: 600px">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>TRANG QUẢN LÝ</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-cutlery" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/FoodManagement"><h4>QUẢN LÝ MÓN ĂN</h4></a>
                        <p>Thêm, chỉnh sửa hoặc xóa những món ăn, thực phẩm của bạn</p>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-table" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1"> <h4>QUẢN LÝ THỰC ĐƠN</h4></a>
                        <p>Thêm, chỉnh sửa hoặc xóa thực đơn mẫu cho người dùng tham khảo</p>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
<%--                    <div class="text-center">--%>
<%--                        <i class="ico-light ico-lg ico-rounded ico-hover et-compass"></i>--%>
<%--                        <a href="#"><h4>Calculate calories in the meal</h4></a>--%>
<%--                        <p>Provide a table of nutrition statistics for your meals.</p>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>