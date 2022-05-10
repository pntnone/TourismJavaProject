<%-- 
    Document   : search
    Created on : Nov 6, 2020, 10:06:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<div class="container" style="max-width: 1980px;padding-left:0;">
    <div class="row">
        <div class="col-lg-2">
            <div class="sidesearch" style="width: 12%;height: 100%;z-index: 2 ;position: fixed;background-color: #1e7d65e6">
                <label for="sort"  class="mt-5"><b>Sắp xếp:</b></label>
                <div id="sort">
                    <button id="sortTitle" class="btn btn-info sideitem" >Theo Tên</button>
                    <button id="sortPrice" class="btn btn-info sideitem" >Theo Giá</button>
                    <button id="sortAmount" class="btn btn-info sideitem" >Theo Số Lượng Người</button>
                    <button id="sortStartTime" class="btn btn-info sideitem" >Theo Thời Gian</button>

                </div>

                <label for="category" class="mt-5"><b>Phân Loại</b></label>
                <div id="category" >
                    <button id="sortDep" class="btn btn-info sideitem">Điểm Xuất Phát</Button>
                    <button id="sortDes" class="btn btn-info sideitem">Điểm Đến</Button>
                    <button id="sortName" class="btn btn-info sideitem">Vùng Miền</Button>
                </div>


                <label for="category" class="mt-5"><b>Kiểu</b></label>
                <div id="kieu" >
                    <button id="asc" class="btn btn-info sideitem">Tăng Dần</Button>
                    <button id="desc" class="btn btn-info sideitem">Giảm Dần</Button>

                </div>

            </div>
        </div>
        <div class="col-lg-1">
        </div>
        <div class="col-lg-9" style="padding-top: 50px;">
            <h1  id="simbox" style="background-color: #80d410b8;
                 border-radius: 5px;
                 padding: 10px;
                 display:inline">TÌM KIẾM: <input type="text" name="search" id="searchInput" style="border-radius: 10px;background-color: #0404047a;color: #39b394;" value="${Page.lastKey}">
                <button class="btn btn-success" id="advanceBut" style="font-size: 21px;background-color: #1d291f;">NÂNG CAO</button>
            </h1>
            <h1 id="advbox" style="background-color: #24c2d2b8;
                border-radius: 10px;
                padding: 8px;font-size: 27px;display:none">TÌM KIẾM NÂNG CAO: 
                <select name="from" id="fromIn" style="border-radius: 10px;background-color: #0404047a;color: #39b394;">
                    <option value="all">Bắt đầu -------------</option>
                    <c:forEach var="dep" items="${AvailTour}">
                        <option value="${dep.departure}">${dep.departure}</option>
                    </c:forEach>
                </select>
                <select name="ro" id="toIn" style="border-radius: 10px;background-color: #0404047a;color: #39b394;">
                    <option value="all">Đến-----------------</option>
                    <c:forEach var="des" items="${AvailTour}">
                        <option value="${des.destination}">${des.destination}</option>
                    </c:forEach>
                </select>
                <select name="flight" id="fightIn" style="border-radius: 10px;background-color: #0404047a;color: #39b394;">
                    <option value="all">Miền ---------</option>
                    <c:forEach var="cat" items="${Cate}">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-success" id="simpleBut" style="font-size: 18px;background-color: #1d291f;">ĐƠN GIẢN</button>
            </h1>

            <nav aria-label="Page navigation" style="margin-top: 40px; margin-bottom: 40px;">
                <ul class="pagination" id="pagination"></ul>
            </nav>
            <div class="container mt-5" id="result">
                <div class="row" id="dong">
                    <c:forEach var="tour" items="${Tours}">
                        <div class="col-lg-4" style="color: black">
                            <div class="card" style="width: 18rem; min-height: 550px;margin-bottom: 20px;">
                                <img class="card-img-top" src="template/images/${tour.thumbnail}" alt="Card image cap" style="height: 180px;">
                                <div class="card-body">
                                    <h5 class="card-title">Từ ${tour.departure} Đến ${tour.destination}</h5>
                                    <p class="card-text">${tour.title}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Từ ${tour.startTime} Đến ${tour.endTime}</li>
                                    <li class="list-group-item">Số Người: ${tour.curAmount}  / ${tour.maxAmount}</li>
                                    <li class="list-group-item">Giá: ${tour.price} đ</li>
                                </ul>
                                <div class="card-body">
                                    <a href="./tour?id=${tour.id}" class="card-link">Xem Thêm <i class="fal fa-info-square"></i></a>
                                    <button  id="dc${tour.id}" class="card-link datcho">Đặt Chỗ <i class="fas fa-money-check-edit-alt"></i></button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <form action="./search" method="GET" id="formhid">
                <input type="hidden" id="maxItemsInPage" name="maxItemsInPage" value="3">
                <input type="hidden" id="startPage" name="startPage" value="1">
                <input type="hidden" id="visiblePages" name="visiblePages">
                <input type="hidden" id="amountOfItems" name="amountOfItems">
                <input type="hidden" id="keySearch" name="flexSearchQuery">
                <input type="hidden" id="lastKey" name="lastKey">
                <input type="hidden" id="dimSort" name="dimSort">
                <input type="hidden" id="orderBy" name="orderBy" value="t.id">
            </form>


        </div>  
    </div>
    <div class="row">

    </div>


</div>
<script type="text/javascript">
    $("#searchInput").focus();
    var displayPage = ${Page.visiblePages};
    var pageCount = ${Page.totalPage};
    var startedPage = ${Page.startPage};
    var countItems = ${Page.amountOfItems};
    var orderBy = "${Page.orderBy}" ;
    var dimSort = "${Page.dimSort}";

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: pageCount,
            visiblePages: displayPage,
            startPage: startedPage,
            onPageClick: function (event, page) {
                if (startedPage !== page) {
                    console.log(page + ' (from options)');
                    var key = $("#searchInput").val();
                    $("#keySearch").val(key);
                    $("#lastKey").val(key);
                    $('#startPage').val(page);
                    $('#visiblePages').val(displayPage);
                    $('#amountOfItems').val(countItems);
                    $('#orderBy').val(orderBy);
                    $("#dimSort").val(dimSort);
                    $('#formhid').submit();
                }
            }
        });
    });

    $("#advanceBut").click(function () {
        $("#advbox").css("display", "inline");
        $("#simbox").css("display", "none");
    });

    $("#simpleBut").click(function () {
        $("#simbox").css("display", "inline");
        $("#advbox").css("display", "none");
    });

    $("#searchInput").keypress(function (e) {
        if (e.which == 13) {
            resetPage();
        }

    });

    function resetPage() {
        var key = $("#searchInput").val();
        $("#keySearch").val(key);
        $("#lastKey").val(key);
        $('#startPage').val(1);
        $('#visiblePages').val(1);
        $('#amountOfItems').val(-1);
        $('#formhid').submit();
    }
    ;

    $("#asc").click(function () {
        $('#orderBy').val(orderBy);
        $("#dimSort").val("asc");
        resetPage();
    });

    $("#desc").click(function () {
        $('#orderBy').val(orderBy);
        $("#dimSort").val("desc");
        resetPage();
    });

    $("#sortTitle").click(function () {
        $("#orderBy").val("t.title");
        resetPage();
    });

    $("#sortPrice").click(function () {
        $("#orderBy").val("t.price");
        resetPage();
    });

    $("#sortAmount").click(function () {
        $("#orderBy").val("t.max_amount");
        resetPage();
    });

    $("#sortStartTime").click(function () {
        $("#orderBy").val("t.start_time");
        resetPage();
    });

    $("#sortDep").click(function () {
        $("#orderBy").val("at.departure");
        resetPage();
    });

    $("#sortDes").click(function () {
        $("#orderBy").val("at.destination");
        resetPage();
    });

    $("#sortName").click(function () {
        $("#orderBy").val("ct.name");
        resetPage();
    });
    var accountName = "${sessionScope.User.name}";
    function checkSignIn() {
        if (accountName === "") {
            alert("Bạn cần đăng nhập để thực hiện tác vụ!");
            return false;
        } else {
            return true;
        }
    }
    
     $("#dong").on("click",".datcho",function (e) {
        if(!checkSignIn())return;
        var tourId = $(this).attr("id").substring(2);
        e.preventDefault();
        $.ajax({
                url: './cart',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: tourId
                },
                error: function () {
                    alert("Send Message Failed");
                }
            }).done(function (data) {
                var json = JSON.parse(data);
                $("#numberCart").html(json.amount);
            });    
    });


</script>
<%@include file="template/footer.jsp"%>
