<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.service.DoctorService" %>
<%@ page import="hospital.user.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.DoctorDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生管理</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- 引入一个js文件 -->
    <script src="js/Docter.js"></script>
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

        .active {
            background-color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
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
    <h1>医生管理</h1>
    <%
        DoctorDaoImpl dockerdaoimpl = new DoctorDaoImpl();
        List<Doctor> dockerlist = null;
        int hospitalId = -1;
        int departmentId = -1;
        try {
            hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
            departmentId = Integer.parseInt(request.getParameter("departmentId"));
            dockerlist = dockerdaoimpl.findAll(hospitalId, departmentId); // 调用 findAll() 函数获取全部用户信息
        } catch (Exception e) {
            e.printStackTrace();
        }
        assert dockerlist != null;
    %>
    <div>
        <table>
            <thead>
            <tr>
                <th>医生姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>电话号码</th>
                <th>所属医院</th>
                <th>所属科室</th>
                <th>职称</th>
                <th>介绍</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%for (Doctor doctor : dockerlist) { %>
            <tr>
                <td><%= doctor.getName() %></td>
                <td><%= doctor.getSex() %></td>
                <td><%= doctor.getAge() %></td>
                <td><%= doctor.getPhone() %></td>
                <td><%= doctor.getPart() %></td>
                <td><%= doctor.getPart2() %></td>
                <td><%= doctor.getPart3() %></td>
                <td><%= doctor.getDiscript() %></td>
                <td>
                    <label>
                        <input type="hidden" name="docterId" value="<%=doctor.getId()%>">
                        <input type="hidden" name="hospitalId" value="<%=hospitalId%>">
                        <input type="hidden" name="departmentId" value="<%=departmentId%>">
                    </label>
                    <button class="button" type="submit" onclick="DeleteDoctor('<%= A_Name %>', <%= hospitalId %>, '<%= departmentId %>', <%= doctor.getId() %>); return false;">删除医生</button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>