<%@ page import="hospital.dao.impl.SickDaoImpl" %>
<%@ page import="hospital.user.Sick" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/13
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>预约管理</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- 引入一个js文件 -->
  <script src="js/Sick.js"></script>
  <link rel="stylesheet" href="css/navbar.css">
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
  <h1>预约管理</h1>
  <%
    SickDaoImpl sickdaoimpl = new SickDaoImpl();
    List<Sick> sickList = null;
    int patientID = -1;
    try {
      patientID = Integer.parseInt(request.getParameter("patientID"));
      sickList = sickdaoimpl.find(patientID); // 调用 findAll() 函数获取全部用户信息
    } catch (Exception e) {
      e.printStackTrace();
    }
    assert sickList != null;
  %>
  <div>
    <table>
      <thead>
      <tr>
        <th>患者名称</th>
        <th>预约医院</th>
        <th>预约科室</th>
        <th>预约医生</th>
        <th>预约日期</th>
        <th>预约时间段</th>
        <th>预约状态</th>
        <th>缴费状态</th>
        <th>缴费金额</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <%for (Sick sick : sickList) { %>
      <tr>
        <td><%= sick.getP_name() %></td>
        <td><%= sick.getHospitalname() %></td>
        <td><%= sick.getDepartmentname() %></td>
        <td><%= sick.getD_name() %></td>
        <td><%= sick.getData() %></td>
        <td><%= sick.getTime() %></td>
        <td><%= sick.getAppointmentstatus() %></td>
        <td><%= sick.getPaymentstatus() %></td>
        <td><%= sick.getPaymentamount() %></td>
        <td>
          <label>
            <input type="hidden" name="patientID" value="<%=patientID%>">
          </label>
          <button class="button" type="submit" onclick="DeleteSick('<%=patientID%>','<%=sick.getId()%>', '<%=A_Name%>'); return false;">删除记录</button>
          <button class="button" type="submit" onclick="ReviseSick('<%=patientID%>', '<%=sick.getId()%>', '<%=A_Name%>'); return false;">修改信息</button>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
