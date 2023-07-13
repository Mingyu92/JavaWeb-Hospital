<%@ page import="hospital.service.AdminService" %>
<%@ page import="hospital.user.Hospital" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.user.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>更新个人信息</title>
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/update.css">
</head>
<body>
<div class="top-bar">
    <div class="login-page">更新页面</div>
</div>
<form action="DoctorUpdate" method="post">
    <table>
        <%--第一行:姓名--%>
        <tr>
            <td><label for="name">姓名</label> </td>
            <td><input type="text" name="name" id="name"></td>
        </tr>

        <%--第四行:性别--%>
        <tr>
            <td><input type="radio" name="sex" value="男">男</td>
            <td><input type="radio" name="sex" value="女">女</td>
        </tr>
        <%--第五行:年龄--%>
        <tr>
            <td><label for="age">年龄</label> </td>
            <td><input type="text" name="age" id="age"></td>
        </tr>
        <%--第六行:电话--%>
        <tr>
            <td><label for="phone">电话</label> </td>
            <td><input type="text" name="phone" id="phone"></td>
        </tr>
        <%
            AdminService adminService=new AdminService();
            /*获取从登录页面和注册页面传入的id*/
            List<Hospital> hospitalList = adminService.AllHospital();
        %>

        <%--第七行:所属医院--%>
        <tr>
            <td><strong>所属医院</strong></td>
            <td>
                <select name = "Hospital">
                    <% for (Hospital hospital : hospitalList) { %>
                    <option value="<%= hospital.getId() %>">
                        <%= hospital.getName() %>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>

        <%
            /*获取从登录页面和注册页面传入的id*/
            int id = Integer.parseInt(request.getParameter("id"));
            List<Department> departmentList = adminService.AllDepartment();
        %>

        <%--第八行:科室(设置六个科室可供选择)--%>
        <tr>
            <td><strong>所属科室</strong></td>
            <td>
                <select name = "Department">
                    <% for (Department department : departmentList) { %>
                    <option value="<%= department.getDepartmentid() %>">
                        <%= department.getDepartmentname() %>
                    </option>
                    <% } %>
                </select>
        </tr>

        <%--第九行:职称--%>
        <tr>
            <td><strong>职称</strong></td>
            <td>
                <select name="ProfessionalTitle">
                    <option value="院长">院长</option>
                    <option value="副院长">副院长</option>
                    <option value="主任医师">主任医师</option>
                    <option value="副主任医师">副主任医师</option>
                    <option value="主治医生">主治医生</option>
                </select>
            </td>
        </tr>

        <%--第十行:个人介绍--%>
        <tr>
            <td><strong>个人介绍</strong></td>
            <td>
                <textarea name="Introduction" rows="5" cols="50" id="Introduction"></textarea>
            </td>
        </tr>

            <td>
                <label>
                    <input type="hidden" name="id" value="<%=id%>">
                </label>
            </td>

        <tr>
            <td><input type="submit" value="更新"></td>
            <td><input type="reset" value="重置"></td>
        </tr>

    </table>

    <div class="bottom-bar"></div>
</form>
</body>
</html>
