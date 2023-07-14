<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/12
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.dao.impl.DepartmentDaoimpl" %>
<%@ page import="hospital.user.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>修改科室信息</title>

  <link rel="stylesheet" href="css/admin_youshangjiao.css">
  <link rel="stylesheet" href="css/navbar.css">
  <link rel="stylesheet" href="css/juzhong.css">
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
    <!-- 添加更多功能模块链接 -->
  </ul>
</div>
<div>
  <h1>科室管理</h1>
  <%
    int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
    int departmentId = Integer.parseInt(request.getParameter("departmentId"));
    DepartmentDaoimpl departmentdaoimpl = new DepartmentDaoimpl();
    Department department;
    department = departmentdaoimpl.find(departmentId);
  %>
  <div class="form-container">
    <form action="UpdateDepartment" method="POST">
      <!-- 替换 /updateHospital 为你想要处理更新请求的 URL -->
      <input type="hidden" name="hospitalId" value="<%= hospitalId %>">
      <input type="hidden" name="D_Id" value="<%= department.getId() %>">
      <input type="hidden" name="A_Name" value="<%= A_Name %>">
      <label>科室名称:</label>
      <input type="text" name="name" value="<%= department.getDepartmentname() %>">

      <label>科室负责人:</label>
      <input type="text" name="head" value="<%= department.getDepartmenthead() %>">

      <label>简介:</label>
      <textarea name="introduction"><%= department.getIntroduction() %></textarea>

      <label>服务时间:</label>
      <input type="text" name="time" value="<%= department.getClinichours() %>">

      <input type="submit" value="保存修改">
    </form>
  </div>
</div>
</body>
</html>