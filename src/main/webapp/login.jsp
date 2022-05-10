<%-- 
    Document   : signup
    Created on : Oct 26, 2020, 11:22:41 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<div class="container logform spacenav">
    <form action="./login" method="POST">
        <div class="form-group">
            <label for="Username">Tên Đăng Nhập</label>
            <input type="text" class="form-control" id="Username" name="username" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="password">Mật Khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>

        <div class="form-group" id="saimk">
            <div class="alert alert-danger" role="alert">
                Sai Mật Khẩu hoặc Tên Đăng Nhập!
            </div>
        </div>
        <% String urlPath = (String)request.getAttribute("UriAfterLogin"); 
            if(urlPath!=null) { %>
            <input type="hidden" name="beforeUri" value="<%=urlPath%>">
            <%}%>
            <button type="submit" class="btn btn-primary" id="subbtn" style="
    background-color: #177758;
    border-color: #bcce58;
">Đăng Nhập</button>
    </form>
</div>

<%@include file="template/footer.jsp"%>