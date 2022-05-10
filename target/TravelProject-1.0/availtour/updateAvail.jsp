<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/parts/admin/header.jsp" %>
<div class="about" style="padding-left: 50px;
     margin-top: 100px;
     margin-bottom: 100px;">
    <!-- Default form register -->
    <form class="text-center border border-light p-5" id="formsub" method="post" action="<c:url value="/avail-tour-update"/>">

        <p class="h4 mb-4">CẬP NHẬT CHI NHÁNH</p>
        
        <h1>ID: ${Tour.id}</h1>
        <input type="hidden"  name="id" value="${Tour.id}" >
        <div class="form-row mb-4">
            <div class="col">
                <input type="text"  name="departure" class="form-control" placeholder="BẮT ĐẦU" value="${Tour.departure}">
            </div>
            <div class="col">
                <input type="text" name="destination" class="form-control" placeholder="ĐẾN" value="${Tour.destination}">
            </div>
        </div>


            <input type="text" name="thumbnail" id="imgName" class="form-control mb-4" placeholder="TÊN ẢNH" value="${Tour.thumbnail}">
        <h5>Ảnh Minh Họa</h5>
        <div id="imaPlace"></div>

        <br>

        <input type="number" name="categoryTourId" id="cateId" class="form-control" placeholder="THỂ LOẠI MIỀN ID" value="${Tour.categoryTourId}">
        <div id="mienPlace"></div>
        <br>

        <input type="text" name="modifiedBy" class="form-control" placeholder="CHỈNH BỞI" value="${sessionScope.User.name}">
        


        <button class="btn btn-info my-4 btn-block" type="submit" id="btnsub">CẬP NHẬT</button>


    </form>
    <!-- Default form register -->     


</div>
<script type="text/javascript">
    $("#formsub").submit(function (e) {
        var ok = true;

        if ($('input[type="text"]').val() === "") {
            ok = false;
        }

        if ($("#cateId").val() < 1 || $("#cateId").val() > 3) {
            ok = false;
        }

        if (!ok) {
            e.preventDefault();
        }
    });


    $("#imgName").keyup(function () {
        var url_f = '<img src=';
        var url_c = '"\<c:url value="/template/images/';
        var url_l = '" /> " style="width:150px">';
        var ima = $(this).val();
        $("#imaPlace").html(url_f + url_c + ima + url_l);
    });

    $("#cateId").keyup(function () {
        var id = $(this).val();
        var ht;
        if (id == 1)
            ht = "Miền Bắc";
        else if (id == 2)
            ht = "Miền Nam";
        else if (id == 3)
            ht = "Miền Trung";
        else
            ht = '<p style="color:red">lỗi: miền không xác định </p>';
        $("#mienPlace").html(ht);
        console.log(id);
    });
</script>

<%@include file="/template/parts/admin/footer.jsp" %>