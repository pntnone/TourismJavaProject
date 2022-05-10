<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/parts/admin/header.jsp" %>
<div class="about" style="padding-left: 50px;
     margin-top: 100px;
     margin-bottom: 100px;">
    <!-- Default form register -->
    <form class="text-center border border-light p-5" id="formsub" method="post" action="<c:url value="/admin-tour-create"/>">

        <p class="h4 mb-4"> TẠO TOUR MỚI</p>

        <div class="form-row mb-4">
            <div class="col">
                THỜI GIAN BẮT ĐẦU:<input type="date"  name="startTime" class="form-control" placeholder="THỜI GIAN BẮT ĐẦU">
            </div>
            <div class="col">
                THỜI GIAN ĐẾN:<input type="date" name="endTime" class="form-control" placeholder="THỜI GIAN ĐẾN">
            </div>

            <br>
        </div>   


        <label for="availId" ><i class="fas fa-code-branch"></i> CHI NHÁNH:</label>

        <select name="availTourId" id="availId" class="form-control mb-4" style="max-height: 60px;">
            <c:forEach var="avtour" items="${AvailTours}">
                <option value="${avtour.id}">${avtour.id} -  Từ ${avtour.departure} Đến ${avtour.destination}</option>
            </c:forEach>
        </select>

        <br>

        <input type="text" name="title" class="form-control" placeholder="CHỦ ĐỀ">
        <br>

        <input type="text" name="flight" class="form-control" placeholder="HÃNG BAY">
        <br>

        <input type="text" name="maxAmount" class="form-control" placeholder="SỐ LƯỢNG HÀNH KHÁCH TỐI ĐA">
        <br>

        <input type="number" name="price" class="form-control" placeholder="GIÁ">
        <br>


        <input type="number" name="status"  id="status" class="form-control" placeholder="Tình Trạng">
        <div id="mienPlace"></div>
        <br>


        <input type="hidden" name="curAmount" value="0">




        <input type="text" name="createdBy" class="form-control" placeholder="TẠO BỞI" value="${sessionScope.User.name}">
        <br>
        <input type="text" name="modifiedBy" class="form-control" placeholder="CHỈNH BỞI" value="${sessionScope.User.name}">
        <br>
        <label for="description">Bài Viết Thêm:</label>

        <textarea id="desc" name="description" class="form-control"  rows="10" cols="50">
        </textarea>

        

        <button class="btn btn-info my-4 btn-block" type="submit" id="btnsub">TẠO</button>

        

    </form>
    <!-- Default form register -->     


</div>
<script type="text/javascript">
    $("#formsub").submit(function (e) {
        var ok = true;

        if ($('input').val() === "") {
            ok = false;
        }

        if ($('input["type=number"]').val() < 0) {
            ok = false;
        }

        if ($("#status").val() < 0 || $("#status").val() > 4) {
            ok = false;
        }

        if (!ok) {
            e.preventDefault();
        }
    });
    $("#status").keyup(function () {
        var id = $(this).val();
        var ht;
        if (id == 1)
            ht = "Chuẩn Bị Đi";
        else if (id == 2)
            ht = "Sắp Sửa Đi";
        else if (id == 3)
            ht = "Hủy";
        else if (id == 4)
            ht = "Đang Tham Khảo";
        else
            ht = '<p style="color:red">lỗi: miền không xác định </p>';
        $("#mienPlace").html(ht);
        console.log(id);
    });

</script>

<%@include file="/template/parts/admin/footer.jsp" %>