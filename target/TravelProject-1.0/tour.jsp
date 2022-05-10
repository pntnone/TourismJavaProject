<%-- 
    Document   : tour
    Created on : Nov 3, 2020, 11:11:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<div class="container" style="margin-top: 50px;background-color: #1639488f;max-width: 1400px;padding: 40px;">
    <div class="row">
        <div class="col-sm-9 rightpack">
            <h3 class="display-4" style="
                color: #c7d270;
                margin-bottom: 35px;
                font-weight: 600;
                ">${Tour.title}</h3>

            <img class="img-fluid" id="mainimg" src="template/images/${Tour.thumbnail}">

            <br><br>

            <hr>
            <div class="row">
                <div class="col-lg-8">
                    <h5>Nơi Khỏi Hành:  <b style="color: #00cc99;font-size: 30px">${Tour.departure}</b>    Nơi Đến:    <b style="color: #00cc99;font-size: 30px">${Tour.destination}</b></h5>
                    <h5>Thời Gian Từ:   <b style="color: #00cc99;font-size: 30px">${Tour.startTime}</b>    Đến:    <b style="color: #00cc99;font-size: 30px">${Tour.endTime}</b></h5>
                </div>
                <div class="col-lg-4">
                    <h5>Giá Tham Khảo: </h5>
                    <strong style="font-size: 28px;color: #ff9999">
                        <fmt:formatNumber type="currency" value="${Tour.price}" /> <small style="text-decoration: underline" ></small>
                    </strong>
                </div>    
            </div>
            <br>

            <div class="row" style="background-color: #0000008c;padding: 10px;">
                <div class="col-lg-4" style="color: #6ef2ff; text-decoration: underline;font-weight: bold">Tình Trạng:
                    <c:choose>
                        <c:when test="${Tour.status==1}">
                            <h4 class="btn btn-success">Chuẩn Bị Đi</h4>
                        </c:when>
                        <c:when test="${Tour.status==2}">
                            <h4 class="btn btn-danger">Đã Hủy</h4>
                        </c:when>
                        <c:when test="${Tour.status==3}">
                            <h4 class="btn btn-warning">2 Ngày Nữa Đi</h4>
                        </c:when>
                    </c:choose>
                </div>
                <div class="col-lg-4" style="color: #6ef2ff; text-decoration: underline;font-weight: bold">
                    Số Người Đã Đặt: <h4 class="btn btn-warning">${Tour.curAmount}  / ${Tour.maxAmount}</h4>
                </div>

                <div class="col-lg-4" style="color: #6ef2ff; text-decoration: underline;font-weight: bold;">
                    <button class="btn btn-outline-success" id="addToCart"> <i class="fal fa-luggage-cart"></i> Thêm Vào Tour</button>
                    <hr>
                    <button class="btn btn-outline-danger" id="cashFirst"> <i class="far fa-money-bill-alt"></i> Đặt Cọc Trước .</button>
                </div> 

            </div>



            <h4>Thông tin thêm:</h4>
            <p>${Tour.description}</p>

            <div class="comment">
                <h4 class="btn btn-primary">Comment:</h4>
                <div id="cmtLine">
                    <c:forEach var="cmt" items="${Comments}">
                        <div class="acmt" id="cmt${cmt.id}">
                            <c:if test="${cmt.accountId == sessionScope.User.id }">
                                <button class="uptBtn btntype1">Chỉnh Sửa</button>
                                <button class="delBtn btntype2">Xóa</button>
                            </c:if>
                            <div class="cmtpart">
                                <small><b>${cmt.name}</b></small>
                                <p id="con${cmt.id}"> ${cmt.content}</p>
                            </div>
                            <hr>
                        </div>
                    </c:forEach>
                </div>
                <form id="cmtForm" action="./comment/create" method="POST">
                    <b class="titcmt">Your Comment: </b><input type="text" id="cmtText" class="form-control" placeholder="comment..." name="content">
                    <input type="hidden" name="tourId" value="${Tour.id}">
                    <input type="hidden" id="accountId" name="accountId" value="${sessionScope.User.id}">
                </form>
                <button id="postCmt" class="btn btn-primary postcmt mt-2"> Post </button>
            </div>

        </div>
        <div class="col-sm-3 leftpack">
            <h4>Bai Viet Lien Quan</h4>
            <hr>
            <c:forEach var="tour" items="${AvailTours}">
                <div class="card mt-2" style="width: 18rem;">
                    <img src="template/images/${tour.thumbnail}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <a href="./search-relevant?destination=${tour.destination}&departure=${tour.departure}" class="card-text">Từ ${tour.departure} Đến ${tour.destination}</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<script type="text/javascript">

    var accountName = "${sessionScope.User.name}";
    var  tourId = "${Tour.id}";
    function checkSignIn() {
        if (accountName === "") {
            alert("Bạn cần đăng nhập để thực hiện tác vụ!");
            return false;
        } else {
            return true;
        }
    }

    $("#postCmt").click(function (e) {
        var content = $('#cmtText').val();
        if (accountName === "") {
            alert("Bạn phải đăng nhập để comment!");
            return;
        }
        if (content === "") {
            alert("bạn cần điền nội dung comment");
            return;
        }
        e.preventDefault();
        $.ajax({
            url: './comment/create',
            type: 'POST',
            dataType: 'html',
            data: $('#cmtForm').serialize(),
            error: function () {
                alert("Send Message Failed");
            }
        }).done(function (data) {
            var newCmt = '<div id="cmtLine">' +
                    '<div class="acmt" id="cmt' + data + '">' +
                    '<button class="uptBtn btntype1">Chỉnh Sửa</button>' +
                    '<button class="delBtn btntype2">Xóa</button>' +
                    '<div class="cmtpart">' +
                    '<small><b>' + accountName + '</b></small>' +
                    '<p id="con' + data + '">' + content + '</p>' +
                    '</div><hr></div>';

            $('#cmtLine').append(newCmt);
            $('#cmtText').val('');
        });
    });

    $('#cmtLine').on("click", ".delBtn", function (e) {
        var r = confirm('Bạn Có Muốn Xóa ?');
        if (r === false) {
            return;
        }
        var idParent = $(this).parent().attr('id');
        var id = idParent.substring(3);

        e.preventDefault();
        $.ajax({
            url: './comment/delete',
            type: 'GET',
            dataType: 'html',
            data: {
                id: id
            },
            error: function () {
                alert("Send Message Failed");
            }
        }).done(function () {
            idParent = "#" + idParent;
            console.log(idParent);
            $('div').remove(idParent);
        });

    });

    $('#cmtLine').on("click", ".uptBtn", function () {
        var acmtElem = $(this).parent();
        var id = acmtElem.attr('id').substring(3);
        var pContentElem = $("#con" + id);
        var text = pContentElem.text();
        var acmtHtml = acmtElem.html();

        pContentElem.remove();
        $(this).siblings(".cmtpart").append('<input id="newText' + id + '" type="text" class="form-control" placeholder="chỉnh sửa ở đây."  style="display:inline-block" value="' + text + '">');
        $(this).siblings("hr").remove();
        $(this).parent().append('<button id="dx' + id + '" class="btntype1">Đã Xong</button>');
        $(this).parent().append('<button id="huy' + id + '" class="btntype2">Hủy</button><hr>');
        $("#huy" + id).click(function () {
            acmtElem.children().remove();
            acmtElem.append(acmtHtml);
        });
        $("#dx" + id).click(function () {
            var newText = $("#newText" + id).val();
            $.ajax({
                url: './comment/update',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: id,
                    content: newText
                },
                error: function () {
                    alert("Send Message Failed");
                }
            }).done(function () {
                console.log(newText);
                acmtElem.children().remove();
                acmtElem.append(acmtHtml);
                $("#con" + id).text(newText);
            });
        });
        $(this).css("display", "none");
        $(this).siblings(".delBtn").css("display", "none");
    });

    $("#addToCart").click(function () {
        if(!checkSignIn())return;
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

    $("#cashFirst").click(function () {
        if(!checkSignIn())return;
    });

</script>
<%@include file="template/footer2.jsp"%>
