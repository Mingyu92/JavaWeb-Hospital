<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/12
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.dao.impl.SickDaoImpl" %>
<%@ page import="hospital.user.Sick" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>修改预约信息</title>
  <link rel="stylesheet" href="css/leave.css">
  <style>
    ul.navbar {
      list-style-type: none;
      margin: 0;
      padding: 0;
      background-color: #f1f1f1;
      overflow: hidden;
    }

    ul.navbar li {
      float: left;
    }

    ul.navbar li a {
      display: block;
      color: black;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    ul.navbar li a:hover:not(.active) {
      background-color: #ddd;
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
    <!-- 添加更多功能模块链接 -->
  </ul>
</div>
<div>
  <h1>预约管理</h1>
  <%
    int patientID = Integer.parseInt(request.getParameter("patientID"));
    int sickID = Integer.parseInt(request.getParameter("sickID"));
    SickDaoImpl sickdaoimpl = new SickDaoImpl();
    Sick sick;
    sick = sickdaoimpl.findById(sickID);
  %>
  <div>
    <form action="UpdateSick" method="POST"> <!-- 替换 /updateHospital 为你想要处理更新请求的 URL -->
      <input type="hidden" name="patientID" value="<%= patientID %>">
      <input type="hidden" name="sickID" value="<%= sickID%>">
      <input type="hidden" name="A_Name" value="<%= A_Name%>">
      <label>患者名称:</label>
      <input type="text" name="patient" value="<%= sick.getP_name() %>" readonly><br><br>

      <label>预约医院:</label>
      <input type="text" name="hospital" value="<%= sick.getHospitalname() %>" readonly><br><br>

      <label>预约科室:</label>
      <input name="departmentname" value="<%= sick.getDepartmentname() %> " readonly><br><br>

      <label>预约医生:</label>
      <input name="docter" value="<%= sick.getD_name() %>" readonly><br><br>

      <label>预约日期:</label>
      <input type="date" name="date" value="<%= sick.getData() %>" ><br><br>

      <label>预约时间段:</label>
      <select name="time">
        <% String[] originalTimeSlots = {"8:00-9:00", "9:00-10:00", "10:00-11:00", "11:00-12:00", "12:00-13:00", "13:00-14:00", "14:00-15:00", "15:00-16:00", "16:00-17:00", "17:00-18:00"}; %>
        <% for (String timeSlot : originalTimeSlots) { %>
        <option value="<%= timeSlot %>"><%= timeSlot %></option>
        <% } %>
      </select><br><br>

      <label>预约状态:</label>
      <input type="text" name="status" value="<%= sick.getAppointmentstatus() %>"><br><br>

      <label>缴费状态:</label>
      <input type="text" name="pay" value="<%= sick.getPaymentstatus() %>"><br><br>

      <label>缴费金额:</label>
      <input type="text" name="payamount" value="<%= sick.getPaymentamount() %>"><br><br>

      <input type="submit" value="保存修改">
    </form>
  </div>
</div>
</body>
</html>