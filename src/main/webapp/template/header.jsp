<%-- 
    Document   : header
    Created on : Oct 26, 2020, 9:57:26 PM
    Author     : Admin
--%>

<%@page import="com.pnttour.travelproject.model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PNT Tour</title>
        <link rel="stylesheet" href="template/bootstrap-4.5.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="template/stylesheet/1.css">
        <link rel="stylesheet" href="template/stylesheet/tours.css">
        <link rel="stylesheet" href="template/fontawesome/css/all.min.css">
        <link rel="shortcut icon" type="image/png" href="template/images/favicon.png"/>
        <script src="template/js/jquery-3.5.1.min.js"></script>
        <script src="template/bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
        <script src="template/js/jquery.twbsPagination.js" type="text/javascript"></script>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="z-index: 4">
            <div class="container-fluid">
                <a class="navbar-brand" href="./home"><img src="template/images/favicon.png" style="width: 30px">PNTTOUR</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                        aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav" style="font-size: 16px;">
                        <a class="nav-link active" href="./home">Trang Chủ <span class="sr-only">(current)</span></a>
                        <a class="nav-link" href="./tours">Tours </a>
                        <a class="nav-link" href="./search">Tìm Kiếm</a>
                        <a class="nav-link" href="#">Gửi Đề Xuất  </a>
                        <a class="nav-link" href="./aboutus.jsp">Về Chúng Tôi </a>
                    </div>

                    <%
                        if (session.getAttribute("User") == null) {%>
                    <div class="navbar-nav ml-auto">
                        <div class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/login"><b>Đăng Nhập <i class="far fa-sign-in-alt"></i></b></a>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link" href="./signup"><b>Đăng Ký <i class="far fa-user-plus"></i></b> </a>
                        </div>
                    </div>
                    <% }%> 
                    <% if (session.getAttribute("User") != null) {%>

                    <div class="navbar-nav ml-auto">
                        <div class="nav-item">
                            <a class="nav-link" href="./show-bill"><b>Đã Chọn 
                                    <i class="fad fa-suitcase" id="cartIcon" style="position: relative;">
                                        <span class="btn-danger" id="numberCart" style="position: absolute;padding: 3px;border-radius: 15px;left: 80%;bottom: 30%">
                                            <c:if test="${sessionScope.Cart != null}">
                                                ${sessionScope.Cart.amountOfItems}
                                            </c:if>
                                        </span>
                                    </i>
                                </b></a>

                        </div>
                        <div class="nav-item">
                            <a class="nav-link" href="./admin"><b><%= ((Account) session.getAttribute("User")).getName()%> <i class="fal fa-user"></i></b></a>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link" href="./logout"><b> Đăng Xuất <i class="far fa-sign-out-alt"></i></b> </a>
                        </div
                    </div>
                    <% }%>        
                </div>
            </div>

        </nav>
