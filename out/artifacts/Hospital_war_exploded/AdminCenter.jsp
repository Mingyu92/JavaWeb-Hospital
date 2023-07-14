<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>管理员首页</title>
  <link rel="stylesheet" href="css/navbar.css">
  <link rel="stylesheet" href="css/center.css">
  <link rel="stylesheet" href="css/leave.css">
</head>
<body>
<h1>桂林市医院统一预约挂号服务平台</h1>
<div>
  <%String A_Name = request.getParameter("A_Name");%>
  <!-- 欢迎管理员登录 -->
  <div class="welcome-admin">
    <div class="dropdown">
      <span>欢迎管理员<%=A_Name%>登录</span>
      <div class="dropdown-content">
        <a href="AdminInformation.jsp?A_Name=<%= A_Name %>">修改资料</a>
        <a href="Choose.jsp">退出登录</a>
      </div>
    </div>
  </div>
  <!-- 导航栏 -->
  <ul class="navbar">
    <li><a href="./AdminCenter.jsp?A_Name=<%= A_Name %>">首页</a></li>
    <li><a href="./AdminUsers.jsp?A_Name=<%= A_Name %>">用户管理</a></li>
    <li><a href="./AdminHospitals.jsp?A_Name=<%= A_Name %>">医院管理</a></li>
  </ul>
</div>

<div>
  <h1>首页</h1>
  欢迎使用桂林市医院统一预约挂号服务平台，感谢您的使用！！！
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
</body>
</html>