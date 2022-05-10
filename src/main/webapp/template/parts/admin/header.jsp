<%@page import="com.pnttour.travelproject.model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <% Account acc = (Account) session.getAttribute("User");
        String roleName = (String) session.getAttribute("RoleUser");%>
    <c:set var="account" value="<%= acc%>"/>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PNT Tour</title>

        <link rel="stylesheet" href="<c:url value="/template/bootstrap-4.5.3-dist/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/fontawesome/css/all.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/stylesheet/tours.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/stylesheet/1.css"/>">
        
        <script src="<c:url value="/template/js/jquery-3.5.1.min.js" />"></script>
     
        <script src="<c:url value="/template/bootstrap-4.5.3-dist/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/template/js/jquery.twbsPagination.js" />" type="text/javascript"></script>
        
    </head>

    <body style="color: #003333">
        <div class="container adminblock" style="max-width: 1440px; ">
            <div class="row">
                <div class="col-lg-3 sidebar">
                    <div class="card adminside" style="width: 18rem;">
                        <img src="<c:url value="/template/images/admin.png"/>" class="card-img-top" alt="...">

                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-user-tag"></i> ${account.name}</h5>
                            <p class="card-text">Vai trò: <%= roleName%></p>
                            <a href="./logout" class="btn btn-primary">Log out <i class="fal fa-sign-out-alt"></i></a>
                        </div>
                    </div>
                    <div class="adminlink">
                        <a href="<c:url value="/home"/>" class="btn btn-primary"><i class="far fa-home"></i> Quay Về Trang Chủ</a>
                    </div>
                    <div class="adminlink">
                        <a href="<c:url value="/readUserTrip?id=${account.id}"/>" class="btn btn-primary"><i class="fas fa-history"></i> Lịch Sử Tour</a>
                    </div>
                    <div class="adminlink">
                        <a href="<c:url value="/readComment?id=${account.id}"/>" class="btn btn-primary"><i class="fab fa-facebook-messenger"></i> Lịch Sử Bình Luận</a>
                    </div>
                    <c:if test="<%=acc.getRoleId() == 1%>">
                        <div class="adminlink">
                            
                            <a href="<c:url value="/avail-tour-list"/>" class="btn btn-primary"><i class="fal fa-tasks"></i> Quản Lý Chí Nhánh</a>
                        </div>
                        
                        <div class="adminlink">
                            
                            <a href="<c:url value="/admin-tours"/>" class="btn btn-primary"><i class="fal fa-tasks"></i> Quản Lý Tour</a>
                        </div>
                    </c:if>
                    <div class="adminlink" style="color: whitesmoke;margin-top:80px;text-align: center">
                        <b>Copyright © PNT TOUR</b>
                        <p>Pham Nam Trung He140980 FPT University.</p>

                    </div>
                </div>
                <div class="col-lg-7">