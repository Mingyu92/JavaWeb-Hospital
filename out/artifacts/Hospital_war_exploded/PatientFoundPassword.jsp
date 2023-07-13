<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/20
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <style>
        .password-message {
            position: absolute;
            top: 475px;
            left: 859px; /* 调整 left 值来控制提示信息的水平位置 */
            margin-top: 5px;
            font-size: 14px;
        }

        .password-match {
            color: green;
        }

        .password-mismatch {
            color: red;
        }

    </style>
    <script>
        function showMessage(message) {
            alert(message);
        }

        function validatePassword() {
            var password = document.getElementById("password").value;
            var SurePassword = document.getElementById("SurePassword").value;
            var message = document.getElementById("passwordMessage");

            if (password === SurePassword) {
                message.innerHTML = "密码匹配";
                message.classList.add("password-match");
                message.classList.remove("password-mismatch");
            } else {
                message.innerHTML = "密码不匹配";
                message.classList.add("password-mismatch");
                message.classList.remove("password-match");
            }
        }

        function updateAgeValue(value) {
            document.getElementById("ageValue").textContent = value;
        }
    </script>
    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
<div class="top-bar">
    <div class="login-page">找回密码页面</div>
</div>
<form action="PatientFoundPassword" method="post">
    <table>
        <%--第一行:姓名--%>
        <tr>
            <td><label for="name">姓名</label></td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <%--第六行:邮箱--%>
        <tr>
            <td><label for="email">邮箱</label></td>
            <td><input type="text" name="email" id="email"></td>
        </tr>
        <tr>
            <td><label for="idCard">身份证号码</label></td>
            <td><input type="text" name="idCard" id="idCard"></td>
        </tr>
        <%--第九行:手机号码--%>
        <tr>
            <td><label for="PhoneNumber">手机号码</label></td>
            <td><input type="text" name="PhoneNumber" id="PhoneNumber"></td>
        </tr>
        <%-- 第二行:密码 --%>
        <tr>
            <td><label for="password">新的密码</label></td>
            <td><input type="password" name="password" id="password" oninput="validatePassword()"></td>
        </tr>
        <%-- 第三行:确认密码 --%>
        <tr>
            <td><label for="SurePassword">新的确认密码</label></td>
            <td><input type="password" name="SurePassword" id="SurePassword" oninput="validatePassword()"></td>
        </tr>
        <tr>
            <td colspan="2"><span class="password-message" id="passwordMessage"></span></td>
        </tr>
            <tr>
                <td><input type="submit" value="提交"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
    </table>
</form>


<% if (request.getAttribute("Errormessage") != null) { %>
<script>
    showMessage("<%= request.getAttribute("Errormessage") %>");
</script>
<% } %>
<div class="bottom-bar"></div>
</body>
</html>
