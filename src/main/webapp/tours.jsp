<%-- 
    Document   : tours
    Created on : Nov 2, 2020, 11:35:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<div class="container bigtitle" style="width: 50%; margin-top: 50px;">
    <h4 class="display-4" style="font-size: 40px;font-weight: bold;;color: #ccff00eb;text-align: center">Những Chuyến Du Lịch Có Sẵn</h4>
    <p style="color:white;text-align: center">Bạn có thể đi cùng chuyến với những người khác để làm quen thêm bạn bè, có thể có thêm nhiều điều thú vị 
    nữa!</p>                 
</div>

<div class="container tours">   
    <div class="row mt-4">

        <c:forEach var="tour" items="${Tours}">
            <div class="col-lg-4">
                <div class="card tour" style="width: 21rem;height: 600px;">
                    <img src="template/images/${tour.thumbnail}" class="card-img-top" alt="Anh Du Lich" style="height: 230px;">
                    <div class="card-body">
                        <h5 class="card-title">${tour.title}</h5>
                        <p class="card-text">Bắt đầu từ: ${tour.departure} - Đến: ${tour.destination} </p>
                        <hr>
                        <p class="card-text">Thời Gian: ${tour.startTime} - ${tour.endTime}</p>
                        <hr>
                        <p>${fn:substring(tour.description,0,100)}...</p>
                        <a href="./tour?id=${tour.id}" class="btn btn-primary" style="    background-color: #35dcc199;border-color: #279079;"><i class="far fa-info-circle"></i> Tìm hiểu thêm </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <form action="./tours" method="GET" id="formhid">
            <input type="hidden" id="maxItemsInPage" name="maxItemsInPage" value="3">
            <input type="hidden" id="startPage" name="startPage" value="1">
            <input type="hidden" id="visiblePages" name="visiblePages">
            <input type="hidden" id="amountOfItems" name="amountOfItems">
        </form>
    </div>

    <nav aria-label="Page navigation" style="margin-top: 40px; margin-bottom: 40px;">
        <ul class="pagination" id="pagination"></ul>
    </nav>

</div>

<div class="container bigtitle" style="width: 50%">
    <h4 class="display-4">Your Pick</h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim</p>                 
</div>


<script type="text/javascript">
    var displayPage = ${Page.visiblePages};
    var pageCount = ${Page.totalPage};
    var startedPage = ${Page.startPage};
    var countItems = ${Page.amountOfItems};
    
    console.log(displayPage + " " + pageCount + " " + startedPage);
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: pageCount,
            visiblePages: displayPage,
            startPage: startedPage,
            onPageClick: function (event, page) {
                if (startedPage !== page) {
                    console.log(page + ' (from options)');
                    $('#startPage').val(page);
                    $('#visiblePages').val(displayPage);
                    $('#amountOfItems').val(countItems);
                    $('#formhid').submit();            
                }
            }
        });
    });
</script>

<%@include file="template/footer2.jsp"%>
