<%@ page import="hospital.dao.impl.AdminDaoImpl" %>
<%@ page import="hospital.user.Admin" %><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改资料</title>
    <link rel="stylesheet" href="css/adminform.css">

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
    </ul>
</div>

<div>
    <h1>管理员修改资料</h1>
    <%
        System.out.println(A_Name);
        AdminDaoImpl admindaoimpl = new AdminDaoImpl();
        Admin admin = admindaoimpl.find(A_Name);
    %>
    <h2><%=A_Name%></h2>
        <div>
            <form action="UpdateAdmin" method="POST"> <!-- 替换 /updateHospital 为你想要处理更新请求的 URL -->
                <input type="hidden" name="A_Id" value="<%= admin.getAdminID()%>">
                <label>姓名:</label>
                <input type="text" name="name" value="<%= admin.getA_Name() %>"><br><br>

                <label>电话号码:</label>
                <input type="text" name="phone" value="<%= admin.getA_phone() %>"><br><br>

                <label>密码:</label>
                <input type="password" name="pwd" ><br><br>

                <label>确认密码:</label>
                <input type="password" name="repwd" ><br><br>

                <input type="submit" value="保存修改">
            </form>
        </div>
</div>

</body>
</html>