<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
        <style>
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <div class="container mt-50">
            <div class="row">
                <div class="text-center" style="width: 100%;">
                    <img src="${pageContext.request.contextPath}${food.getUrlImage()}" class="img-thumbnail" style="width: 30%" alt="${food.getFoodName()}">
                </div>
            </div>
            <form method="post">
                <div class="form-group row">
                    <label for="foodname" class="col-sm-2 col-form-label">Tên món ăn</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="foodname" name="foodname" value="${food.getFoodName()}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="catname" class="col-sm-2 col-form-label">Thể loại</label>
                    <div class="col-sm">
                        <select class="form-control" id="catname" name="catname">
                            <c:forEach var="c" items="${lstCat}">
                                <c:choose>
                                    <c:when test="${c.getCatName() == food.getCatName()}">
                                        <option selected>${c.getCatName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>${c.getCatName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="glucozo" class="col-sm-2 col-form-label">Glucozo</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="glucozo" name="glucozo" value="${food.getGlucozo()}"
                               step="0.01">
                    </div>
                    <label for="kcal" class="col-sm-2 col-form-label text-right">Calo</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="kcal" name="kcal" value="${food.getKcal()}"
                               step="0.01">
                    </div>
                    <label for="lipit" class="col-sm-2 col-form-label text-right">Lipt</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="lipit" name="lipit" value="${food.getLipit()}"
                               step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="protein" class="col-sm-2 col-form-label">Protein</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="protein" name="protein" value="${food.getProtein()}"
                               step="0.01">
                    </div>
                    <label for="vitaminA" class="col-sm-2 col-form-label text-right">VitaminA</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminA" name="vitaminA"
                               value="${food.getVitA()}" step="0.01">
                    </div>
                    <label for="vitaminB" class="col-sm-2 col-form-label text-right">VitaminB</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="VitaminB" name="vitaminB"
                               value="${food.getVitB()}" step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="vitaminC" class="col-sm-2 col-form-label">VitaminC</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminC" name="vitaminC"
                               value="${food.getVitC()}" step="0.01">
                    </div>
                    <label for="vitaminD" class="col-sm-2 col-form-label text-right">VitaminD</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminD" name="vitaminD"
                               value="${food.getVitD()}" step="0.01">
                    </div>
                    <label for="vitaminE" class="col-sm-2 col-form-label text-right">VitaminE</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="VitaminE" name="vitaminE"
                               value="${food.getVitE()}" step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kali" class="col-sm-2 col-form-label">Kali</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="kali" name="kali" value="${food.getKali()}"
                               step="0.01">
                    </div>
                    <label for="fe" class="col-sm-2 col-form-label text-right">Sắt</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="fe" name="fe" value="${food.getFe()}"
                               step="0.01">
                    </div>
                    <label for="natri" class="col-sm-2 col-form-label text-right">Natri</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="natri" name="natri" value="${food.getNa()}"
                               step="0.01">
                    </div>
                </div>
                <div class="form-group row" style="display: none">
                    <label for="urlimg" class="col-sm-2 col-form-label">Image url</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="urlimg" name="urlimg" value="url">
                    </div>
                </div>
<%--                <button id="btnEdit" type="submit" class="btn btn-primary mt-50 mb-50"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>--%>
                <button id="btnEdit" type="submit" formaction="${pageContext.request.contextPath}/Admin/EditFood?id=${food.getFoodID()}" class="btn btn-primary mt-50 mb-50"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
            </form>
        </div>
        <script>
            $("#btnEdit").click(function (e){
                if($("#foodname").val().length == 0){
                    alert("Please enter food name");
                    e.preventDefault();
                    return;
                }
                if($("#glucozo").val().length == 0)
                {
                    $("#glucozo").val(0);
                }
                if($("#kcal").val().length == 0)
                {
                    $("#kcal").val(0);
                }
                if($("#lipit").val().length == 0)
                {
                    $("#lipit").val(0);
                }
                if($("#protein").val().length == 0)
                {
                    $("#protein").val(0);
                }
                if($("#vitaminA").val().length == 0)
                {
                    $("#vitaminA").val(0);
                }
                if($("#VitaminB").val().length == 0)
                {
                    $("#VitaminB").val(0);
                }
                if($("#kali").val().length == 0)
                {
                    $("#kali").val(0);
                }
                if($("#vitaminC").val().length == 0)
                {
                    $("#vitaminC").val(0);
                }
                if($("#vitaminD").val().length == 0)
                {
                    $("#vitaminD").val(0);
                }
                if($("#VitaminE").val().length == 0)
                {
                    $("#VitaminE").val(0);
                }
                if($("#natri").val().length == 0)
                {
                    $("#natri").val(0);
                }
                if($("#fe").val().length == 0)
                {
                    $("#fe").val(0);
                }
            })
        </script>
    </jsp:body>
</t:main>