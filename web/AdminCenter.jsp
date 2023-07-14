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
  <style>
    .welcome-admin {
      position: absolute;
      top: 10px;
      right: 10px;
    }
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-content {
      display: none;
      position: absolute;
      min-width: 160px;
      z-index: 1;
    }
    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }
    .dropdown:hover .dropdown-content {
      display: block;
    }
  </style>
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
  <h2><%=A_Name%></h2>
  欢迎使用桂林市医院统一预约挂号服务平台，感谢您的使用！！！
</div>

</body>
</html>