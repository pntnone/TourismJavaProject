<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<style>
    body{
        background: #ffffff;
        color: #37433e;
    }
    #cartTable {
        margin-bottom: 40px;
    }

    #cartTable td,
    #cartTable th {
        border-bottom: 1px solid rgb(60, 151, 163);
        padding: 8px;
    }
    
     #cartTable tr:nth-child(2n){
      background-color: #b3d4ba;
    }

    #cartTable th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #379c86;
        color: white;
        font-style: italic;
        font-size: 18px;
        font-weight: 300;
    }

    #cartTable {
        margin-bottom: 40px;
    }
    #cartBill {
        margin-bottom: 40px;
        width: 100%;
    }

    #cartBill td,
    #cartBill th {
        border-bottom: 1px solid rgb(130, 182, 107);
        padding: 8px;
    }

    #cartBill th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #89d17b;
        color: white;
        font-style: italic;
        font-size: 18px;
        font-weight: 300;
    }
</style>
<div class="container" style="max-width: 1980px;">
    <div class="row">
        <div class="col-lg-8" style="border-right: 2px solid rgb(24, 115, 151); min-height: 100vh;">
            <table id="cartTable">
                <h3 class="display-4 mb-2 text-center">Các Tour Đã Chọn</h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold" id="dcchon">${sessionScope.Cart.amountOfItems} </i> đã được chọn</p>
                <thead>
                    <tr>
                        <th style="width:25%">Tên Tour</th>
                        <th style="width:15%">Thời Gian</th>
                        <th style="width:10%">Chuyến Bay</th>
                        <th style="width:10%">Số Người</th>
                        <th style="width:15%">Số Lượng</th>
                        <th style="width:20%">Giá</th>
                        <th style="width:10%"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="entry" items="${sessionScope.Cart.tours}">
                    <tr>
                        <td><c:out value="${fn:substring(entry.title,0,100)}"/></td>
                        <td>Từ ${entry.endTime} Đến ${entry.startTime}</td>
                        <td>${entry.flight}</td>
                        <td id="soluong${entry.id}">${entry.curAmount} /${entry.maxAmount} </td>

                        <td>
                            <button class="btn btn-outline-danger minusitem" ><i class="fas fa-minus"></i></button>
                            <i class="text-info font-weight-bold" id="amountOf${entry.id}"> ${entry.amountInCart} </i>
                            <button class="btn btn-outline-success plusitem" ><i class="fas fa-plus"></i></button>
                        </td>

                        <td><fmt:formatNumber type="currency" value="${entry.price}" /></td>
                        <td><button class="btn btn-danger huy" id="huy${entry.id}">Hủy</button><input type="hidden" value="entry.key.id" id="idTour"></td>
                    </tr>
                    </c:forEach>
                </tbody>

            </table>
            <div style="display: inline-block;float: right;margin-right: 120px;">
                <h3>Tổng Thiệt Hại: </h3>
                <h4 style="color: #f2a93e;text-align: center" class="thiethai"><fmt:formatNumber type="currency" value="${sessionScope.Cart.priceAllItems}" /></h4>
            </div>
            <a href="./tours" style="color: #379c86"><i class="far fa-long-arrow-left"></i> Tiếp tục khám phá</a>
        </div>

        <div class="col-lg-4">
            <table id="cartBill">
                <h3 class="display-4 mb-2 text-center">HÓA ĐƠN</h3>
                <h3 class="display-4 mb-2 text-center"><i class="fas fa-receipt"></i></h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold">Chi tiết hóa đơn</i></p>
                <thead>
                    <tr>
                        <th style="width:90%">Số Tiền</th>
                        <th style="width:10%">STT</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="Discount" value="${sessionScope.Cart.amountOfItems * 500000}"/>
                    <tr>
                        <td>
                            <h6>Thiệt Hại</h6>
                            <h6 class="thiethai"><fmt:formatNumber type="currency" value="${sessionScope.Cart.priceAllItems}" /></h6>
                        </td>
                        <td>.1</td>
                    </tr>
                    <tr>
                        <td>
                            <h6>Giảm Giá</h6>
                            <h6 id="giamgia"><fmt:formatNumber type="number" maxFractionDigits="3" value="${500000}" />  x  <fmt:formatNumber type="number" value="${sessionScope.Cart.amountOfItems }" />  =  <fmt:formatNumber type="currency" value="${Discount}" /></h6>
                        </td>
                        <td>.2</td>
                    </tr>
                    <tr>
                        <td>
                            <h6>Giảm Giá Theo Mã</h6>
                            <h6>Mã: <input type="text" maxlength="10" name="idDiscount" id="idDiscount"
                                           style="font-size: 12px; padding: 6px;background-color: #ffffff;color: black"> <button class="btn btn-info" style="font-size: 12px;">Áp
                                    Dụng</button></h6>
                            <h6 id="idDiscountDisplay"></h6>
                        </td>
                        <td>.3</td>
                    </tr>

                </tbody>

            </table>
            <div style="display: inline-block;">
                <h3>Tổng Tiền: <a id="tongtien" href="#" style="text-decoration: underline;color: #f98d8d"><fmt:formatNumber type="currency" value="${sessionScope.Cart.priceAllItems - Discount}" /></a></h3>
            </div>
            <a class="btn btn-outline-warning" href="./createUserTrip" style="display: inline-block;float: right;font-weight: bold;font-size: 22px"><i class="fas fa-money-check-alt"></i> THANH TOÁN<div id="notice"></div></a>
        </div>
    </div>
</div>
<script type="text/javascript">

    function resetPage(id,json){
        $("#numberCart").html(json.amount);
        $("#soluong" + id).html((json.curVolume + json.cartVolume) + "/" + json.maxVolume);
        $(".thiethai").html(formatCurrency(json.allPrice));
        var discount = 500000*json.amount;
        console.log(formatCurrency(json.allPrice));
        var tongtien = json.allPrice - discount;
        $("#giamgia").html("500.000 x " + json.amount + " = " + formatCurrency(discount));
        $("#tongtien").html(formatCurrency(tongtien));
        $("#dcchon").html(json.cartVolume);
    }
        
    $("tbody").on("click",".plusitem",function(){
        var iconElem = $(this).siblings("i");
        var tourId = iconElem.attr('id').substring(8);
        var minusElem =  $(this).siblings("button");
        console.log(tourId);
        var plusElem = $(this);
        $.ajax({
                url: './cart',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: tourId,
                    action: "plus"
                },
                error: function () {
                    alert("Send Message Failed");
                }
            }).done(function (data) {
                var json = JSON.parse(data);
                iconElem.html(json.cartVolume);
                if(json.cartVolume + json.curVolume === json.maxVolume){
                    plusElem.prop('disabled', true);
                }
                minusElem.prop('disabled', false);
                resetPage(tourId,json);
            }); 
        
        
    });
    $("tbody").on("click",".minusitem",function(){
        var iconElem = $(this).siblings("i");
        var tourId = iconElem.attr('id').substring(8);
        console.log(tourId);
        var minusElem = $(this);
        $.ajax({
                url: './cart',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: tourId,
                    action: "minus"
                },
                error: function () {
                    alert("Send Message Failed");
                }
            }).done(function (data) {
                var json = JSON.parse(data);
                iconElem.html(json.cartVolume);
                if(json.cartVolume <= 0){
                    minusElem.prop('disabled', true);
                }
                resetPage(tourId,json);
            }); 
        
        
    });
    
    $("tbody").on("click",".huy",function(){
        var tourId =$(this).attr('id').substring(3);
        var huyElem = $(this);
        $.ajax({
                url: './cart',
                type: 'POST',
                dataType: 'html',
                data: {
                    id: tourId,
                    action: "huy"
                },
                error: function () {
                    alert("Send Message Failed");
                }
            }).done(function (data) {
                var json = JSON.parse(data);
                huyElem.parent("td").parent("tr").remove();
                resetPage(tourId,json);
            }); 
        
        
    });
    // 30 000 000 
    function formatCurrency(money){
        var str = money+"";
        if(str.length<4) return str;
        
        var indexStart = str.length%3;
        var result = "";
        for(let i=0;i<indexStart;i++){
            result+= str[i];
        }
        result+=".";
        for(let i=indexStart ; i<str.length; i++){
            if((i-indexStart)%3===0 && i>2){
                result+=".";
            }
            result+= str[i];         
        }
        
        
        return result+' <span  style="text-decoration: underline">đ</span>';
    }
</script>
<%@include file="template/footer2.jsp"%>
