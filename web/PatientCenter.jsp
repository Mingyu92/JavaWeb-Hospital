<%@ page import="hospital.user.Patient" %>
<%@ page import="hospital.dao.impl.PatientDaoImpl" %>
<%
    int UserID;
    if (request.getAttribute("UserID")!= null) {
        UserID = (int) (request.getAttribute("UserID"));
    } else {
        UserID = Integer.parseInt(request.getParameter("UserID"));
    }
//    PatientDaoImpl patientDaoImpl = new PatientDaoImpl();
//    String Name = patientDaoImpl.find(UserID).getName();
%><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/center.css">
    <link rel="stylesheet" href="css/fanhui.css">
</head>
<body>

<div id="patternContainer">
    <a href="./Choose.jsp"  target="_self">
        <canvas id="patternCanvas" width="80" height="80"></canvas>
    </a>
</div>

<script>
    // 获取画布元素和上下文
    const canvas = document.getElementById('patternCanvas');
    const ctx = canvas.getContext('2d');

    // 绘制圆形
    ctx.beginPath();
    ctx.arc(canvas.width / 2, canvas.height / 2, 30, 0, 2 * Math.PI);
    ctx.fillStyle = 'lightblue'; // 可以更改颜色
    ctx.fill();

    // 添加点击事件监听器
    canvas.addEventListener('click', function() {
        window.open('#', '_self');
    });
</script>

    <h1>
        桂林市医院统一预约挂号服务平台
    </h1>
    <span class="welcome">
<%--        欢迎<%= Name %>使用桂林市医院统一预约挂号服务平台--%>
    </span>


<div>
    <!-- 导航栏 -->
    <ul class="navbar">
        <li><a href="./PatientCenter.jsp?UserID=<%= UserID %>">首页</a></li>
        <li><a href="./PatientShow.jsp?UserID=<%= UserID %>">个人信息</a></li>
        <li><a href="./PatientSelectHospital.jsp?UserID=<%= UserID %>">预约挂号</a></li>
        <li><a href="./PatientSickShow.jsp?UserID=<%= UserID %>">查看挂号信息</a></li>
    </ul>

</div>
<div class="slideshow">
    <img class="active" src="./image/1.jpeg" alt="Image 1">
    <img src="./image/4.jpeg" alt="Image 2">
    <img src="./image/5.jpeg" alt="Image 3">

    <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
    <a class="next" onclick="changeSlide(1)">&#10095;</a>
</div>

<script>
    var slideIndex = 0;
    showSlide(slideIndex);

    // 自动轮播定时器
    setInterval(function() {
        changeSlide(1);
    }, 3000);

    function changeSlide(n) {
        showSlide(slideIndex += n);
    }

    function showSlide(n) {
        var slides = document.getElementsByClassName("slideshow")[0].getElementsByTagName("img");
        if (n >= slides.length) {
            slideIndex = 0;
        } else if (n < 0) {
            slideIndex = slides.length - 1;
        }
        for (var i = 0; i < slides.length; i++) {
            slides[i].classList.remove("active");
        }
        slides[slideIndex].classList.add("active");
    }
</script>
<% if (request.getAttribute("Errormessage") != null) { %>
<script>
    showMessage("<%= request.getAttribute("Errormessage") %>");
</script>
<% } %>
</body>
</html>
