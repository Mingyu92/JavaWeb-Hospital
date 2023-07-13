<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/20
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生注册</title>

    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
<div class="top-bar">
    <div class="login-page">注册页面</div>
</div>
<form action="DoctorRegister" method="post">
    <table>
        <%--第一行:姓名--%>
        <tr>
            <td><label for="name">姓名</label> </td>
            <td><input type="text" name="name" id="name"></td>
        </tr>

            <!--第二行:密码-->
        <tr>
            <td><label for="password">密码</label> </td>
            <td><input type="password" name="password" id="password" oninput="validatePassword()"></td>
        </tr>
        <%--第三行:确认密码--%>
        <tr>
            <td><label for="r_password">确认密码</label></td>
            <td><input type="password" name="r_password" id="r_password" oninput="validatePassword()"></td>
        </tr>

        <tr>
            <td colspan="2"><span class="password-message" id="passwordMessage"></span></td>
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
            <select name = "part1">
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
            List<Department> departmentList = adminService.AllDepartment();
        %>

        <%--第八行:科室(设置六个科室可供选择)--%>
        <tr>
            <td><strong>所属科室</strong></td>
            <td>
            <select name = "part2">
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
                <select name="part3">
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
                <textarea name="discript" rows="5" cols="50" id="discript"></textarea>
            </td>
        </tr>

        <%--第十一行:注册+重置按钮--%>
        <tr>
            <td><input type="submit" value="注册"></td>
<%--            <td><input type="reset" value="重置"></td>--%>
        </tr>
    </table>

    <a href="DoctorLogin.jsp">
        <tr>
            <td colspan="2" align="center">已有账号？请登录</td>
        </tr>
    </a>

</form>
<div class="bottom-bar"></div>
</body>
</html>
