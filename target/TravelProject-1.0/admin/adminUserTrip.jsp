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

    <h1>Lịch Sử Bình Luận Của Bạn:</h1><br>

    <table border="1" style="width: 120%;border-collapse: collapse;color: black" >
        <tr>
            <th  style="width:35%">Tour ID </th>
            <th style="width:30%">Tình Trạng </th>
            <th style="width:30%">Số Lượng </th>
        </tr>
        <c:forEach var="ut" items="${UserTrips}">
            <tr>
                <td><a href="./tour?id=${ut.tourId}">Truy Cập Tour</a> ID: ${ut.tourId}</td>
                <td><small style="display:block;margin-left: 10px">Tình Trạng: </small>  <b style="margin-left: 10px">
                        <c:choose>
                            <c:when test="${ut.status==1}">
                                <h4 class="btn btn-success">Chuẩn Bị Đi</h4>
                            </c:when>
                            <c:when test="${ut.status==2}">
                                <h4 class="btn btn-danger">Đã Hủy</h4>
                            </c:when>
                            <c:when test="${ut.status==3}">
                                <h4 class="btn btn-warning">2 Ngày Nữa Đi</h4>
                            </c:when>
                        </c:choose>
                    </b></td>
                    
                    <td>
                        <h4 class="btn btn-info">${ut.amount} Vé </h4>
                        (  1 Vé Cho 1 Người )
                    </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="/template/parts/admin/footer.jsp" %>