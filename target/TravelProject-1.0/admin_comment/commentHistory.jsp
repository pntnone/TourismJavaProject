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
            <th  style="width:25%">Tour ID </th>
            <th style="width:55%">Content</th>
            <th></th>

        </tr>
        <c:forEach var="cm" items="${Comments}">
            <tr>
                <td><a href="./tour?id=${cm.tourId}">Truy Cập Tour</a> ID: ${cm.tourId}</td>
                <td><small style="display:block;margin-left: 10px">Nội Dung Bình Luận: </small>  <b style="margin-left: 10px">${cm.content}</b></td>
                <td><button  id="del${cm.id}"  class="btn btn-outline-danger dele">Xóa Khỏi Bài Viết </button></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">
    $("table").on("click", ".dele", function () {
        var trElem = $(this).parent("td").parent("tr");
        var id = $(this).attr("id").substring(3);
        $.ajax({
            url: "./comment/delete" ,
            type: 'POST',
            dataType: 'html',
            data: {
                id: id
            },
            error: function () {
                alert("Send Message Failed");
            }
        }).done(function () {
            trElem.remove();
        });


    });
</script>
<%@include file="/template/parts/admin/footer.jsp" %>