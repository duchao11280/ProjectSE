<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:body>
        <div class="container">
            <form>
                <div class="form-group row">
                    <label for="id" class="col-sm-2 col-form-label">Id</label>
                    <div class="col-sm-10">
                        <input type="text" id="id" readonly class="form-control-plaintext" value="1">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="foodname" class="col-sm-2 col-form-label">Thức ăn</label>
                    <div class="col-sm-10">
                        <input type="text" id="foodname" class="form-control-plaintext" value="Bún đậu mắm tôm">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="catname" class="col-sm-2 col-form-label">Thể loại</label>
                    <div class="col-sm-10">
                        <input type="text" id="catname" readonly class="form-control-plaintext" value="Đồ khô">
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-3">
                            <div class="form-group row">
                                <label for="kcal" class="col-sm-2 col-form-label">Calo (kCal/g)</label>
<%--                                <div class="col-sm">--%>
<%--                                    <input type="text" id="kcal" class="form-control" value="3.36">--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>
</t:main>