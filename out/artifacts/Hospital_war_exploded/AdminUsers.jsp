<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.service.PatientService" %>
<%@ page import="hospital.user.Patient" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.PatientDaoImpl" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>管理员首页</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- 引入一个js文件 -->
  <script src="js/Patient.js"></script>
  <link rel="stylesheet" href="css/navbar.css">
  <link rel="stylesheet" href="css/leave.css">
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
  <h1>用户管理</h1>
  <%
    PatientDaoImpl patientdaoimpl = new PatientDaoImpl();
    List<Patient> patientList = null;
    try {
      patientList = patientdaoimpl.findAll(); // 调用 findAll() 函数获取全部用户信息
    } catch (Exception e) {
      e.printStackTrace();
    }
    assert patientList != null;
  %>
  <div>
    <table>
      <thead>
      <tr>
        <th>用户名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>电话号码</th>
        <th>邮箱地址</th>
        <th>出生日期</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <%for (Patient patient : patientList) { %>
      <tr>
        <td>
          <a href="./AdminSick.jsp?A_Name=<%= URLEncoder.encode(A_Name, "UTF-8") %>&patientID=<%= patient.getUserID() %>"><%= patient.getName() %></a>
        </td>
        <td><%= patient.getSex() %></td>
        <td><%= patient.getAge() %></td>
        <td><%= patient.getPhoneNumber() %></td>
        <td><%= patient.getEmail() %></td>
        <td><%= patient.getDateOfBirth() %></td>
        <td>
          <label>
            <input type="hidden" name="Id" value="<%=patient.getUserID()%>">
          </label>
          <button class="button" type="submit" onclick="DeletePatient( '<%= A_Name %>', '<%= patient.getUserID() %>'); return false;">删除用户</button>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>

</div>

</body>
</html>