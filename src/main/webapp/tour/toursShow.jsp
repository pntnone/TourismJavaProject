<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/parts/admin/header.jsp" %>
<div class="about" style="padding-left: 50px;
     margin-top: 100px;
     margin-bottom: 100px;
     max-width: 1200px;">
    <style>
        tr:nth-child(even) {background-color: #f2f2f2;};
        th {
            background-color: #4CAF50;
            color: white;
        };
    </style>

    <h1>Những Tour Có Sẵn:</h1><br>
    <h4><a href="<c:url value="/admin-tour-create"/>"><i class="fal fa-plus-square"></i> TOUR</a></h4>
    <table border="1" style="width: 125%;border-collapse: collapse;" >
        <tr>
            <th>Ảnh</th>
            <th>Địa Điểm</th>
            <th>Thời gian</th>
            <th>Giá</th>
            <th>Số Khách</th>
            <th>Sửa-Xóa</th>
            <th>Tạo Bởi</th>
            <th>Lần cuối</th>

        </tr>
        <c:forEach var="tour" items="${Tours}">
            <tr>
                <td><img src="<c:url value="/template/images/${tour.thumbnail}"/>" class="card-img-top" alt="Anh Du Lich" style="width: 50px;"></td>
                <td>Từ ${tour.departure} Đến ${tour.destination}</td>
                <td>Từ ${tour.startTime} Đến ${tour.endTime}</td>
                <td>${tour.price} đ</td>
                <td>${tour.curAmount} / ${tour.maxAmount}</td>
                <td><a href="<c:url value="/admin-tour-update?id=${tour.id}"/>"><i class="fas fa-tools"></i></a> -- 
                    <a onclick="return confirm('Bạn có chắc là muốn xóa mục này');" href="<c:url value="/admin-tour-delete?id=${tour.id}"/>"><i class="far fa-trash-alt"></i></a></td>
                <td>${tour.createdBy}</td>
                <td>${tour.modifiedBy}</td>
            </tr>
        </c:forEach>
    </table>
    <form action="<c:url value="/admin-tours" />" method="GET" id="formhid">
            <input type="hidden" id="maxItemsInPage" name="maxItemsInPage" value="10">
            <input type="hidden" id="startPage" name="startPage" value="1">
            <input type="hidden" id="visiblePages" name="visiblePages">
            <input type="hidden" id="amountOfItems" name="amountOfItems">
    </form>
    
    <nav aria-label="Page navigation" style="margin-top: 40px; margin-bottom: 40px;">
        <ul class="pagination" id="pagination"></ul>
    </nav>
    
</div>

    <script type="text/javascript">
    var displayPage = ${Page.visiblePages};
    var pageCount = ${Page.totalPage};
    var startedPage = ${Page.startPage};
    var countItems = ${Page.amountOfItems};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: pageCount,
            visiblePages: displayPage,
            startPage: startedPage,
            onPageClick: function (event, page) {
                if (startedPage !== page) {
                    $('#startPage').val(page);
                    $('#visiblePages').val(displayPage);
                    $('#amountOfItems').val(countItems);
                    $('#formhid').submit();
                }
            }
        });
    });
</script>
<%@include file="/template/parts/admin/footer.jsp" %>