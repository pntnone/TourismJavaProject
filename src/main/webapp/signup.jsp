<%-- 
    Document   : signup
    Created on : Oct 26, 2020, 11:22:41 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>

<div class="container logform spacenav">
    <form  name="signup" action="./signup" onsubmit="return validateForm()" method="POST">
        <div class="form-group">
            <label for="Username">Tên Đăng Nhập</label>
            <input type="text" class="form-control" id="Username" name="username" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="password">Mật Khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>
        
        <div class="form-group">
            <label for="password">Tên Người Dùng</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Name">
        </div>
        
        
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="cbdk">
            <label class="form-check-label" for="cbdk">Tôi Đồng Ý Với Điều Khoản</label>
        </div>
        <b>Điều khoản dịch vụ</b>
        <p>Bên cạnh các điều khoản này, chúng tôi cũng ban hành Chính sách quyền riêng tư. 
            Mặc dù không nằm trong các điều khoản này, nhưng đây là một chính sách bạn nên đọc để hiểu \
            rõ hơn cách bạn có thể cập nhật, quản lý, xuất và xóa thông tin của mình</p>
        <button type="submit" class="btn btn-primary" id="subbtn" style="
    background-color: #177758;
    border-color: #bcce58;
">Đăng Ký</button>
    </form>
</div>

<script>

    function validateForm() {
        var username = document.forms["signup"]["username"].value;
        var password = document.forms["signup"]["password"].value;

        if (username.length < 8) {
            alert("Username must >= 8");
            return false;
        }

        if (password.length < 8) {
            alert("Password must >= 8");
            return false;
        }
    }


    var submit = document.getElementById("subbtn");
    var checkbox = document.getElementById("cbdk");
    submit.disabled = true;

    cbdk.addEventListener("click", function () {
        if (checkbox.checked == true) {
            submit.disabled = false;
        }
        else{
            submit.disabled = true;
        }
    })




</script>
<%@include file="template/footer.jsp"%>