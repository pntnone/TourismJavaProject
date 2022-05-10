<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/parts/admin/header.jsp" %>
<div class="about" style="padding-left: 50px;
     margin-top: 100px;
     margin-bottom: 100px;">
    <style>
        tr:nth-child(even) {background-color: #f2f2f2;};
        th {
            background-color: #4CAF50;
            color: white;
        };
    </style>

    <h1>Những Điểm Đã Có Chi Nhánh:</h1><br>
    <h4><a href="<c:url value="/avail-tour-create"/>"><i class="fal fa-plus-square"></i> Tạo Mới Chí Nhánh</a></h4>
    <table border="1" style="width: 120%;border-collapse: collapse;" >
        <tr>
            <th>Ảnh Tượng Trưng</th>
            <th>Từ Đâu Đến Đâu</th>
            <th>Thể Loại Miền</th>
            <th>Sửa - Xóa</th>
            <th>Tạo Bởi</th>
            <th>Lần cuối</th>

        </tr>
        <c:forEach var="tour" items="${Tours}">
            <tr>
                <td><img src="<c:url value="/template/images/${tour.thumbnail}"/>" class="card-img-top" alt="Anh Du Lich" style="width: 80px;"></td>
                <td>Từ ${tour.departure} Đến ${tour.destination}</td>
                <td>${tour.categoryTourId}</td>
                <td><a href="<c:url value="/avail-tour-update?id=${tour.id}"/>"><i class="fas fa-tools"></i></a> -- 
                    <a onclick="return confirm('Bạn có chắc là muốn xóa mục này');" href="<c:url value="/avail-tour-delete?id=${tour.id}"/>"><i class="far fa-trash-alt"></i></a></td>
                <td>${tour.createdBy}</td>
                <td>${tour.modifiedBy}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="/template/parts/admin/footer.jsp" %>