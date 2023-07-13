<%--将doctor的id传给Update--%>
<%--<a href="DoctorUpdate.jsp?phone=<%=phone%>">--%>
<%--    <input type="button" value="修改个人信息">--%>
<%--</a>--%>
<%--&lt;%&ndash;将doctor所属科室传给DoctorSickShow&ndash;%&gt;--%>
<%--<a href="DoctorSickShow.jsp?part=<%=part%>">--%>
<%--    <input type="button" value="病人数据">--%>
<%--</a>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="hospital.service.DoctorService" %>
<%@ page import="hospital.user.Doctor" %>

<html>
<head>
    <title>医生主页</title>
    <link rel="stylesheet" href="css/dockershow.css">

</head>
<body>

<div class="top-bar">
    <div class="login-page">医生首页</div>
</div>

<%
    DoctorService doctorService=new DoctorService();

    int id= (int) request.getAttribute("id");
        /*获取从登录页面和注册页面传入的id*/
    Doctor doctor=doctorService.DoctorShow(id);
    if (doctor != null) {
%>

<div>
        <table>
            <thead>
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>联系方式</th>
                <th>所属医院</th>
                <th>所属科室</th>
                <th>职称</th>
                <th>个人简介</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <%--                <td><%=doctor.getId() %></td>--%>
                <td><%=doctor.getName() %></td>
                <%--                <td><%=doctor.getPassword() %></td>--%>
                <td><%=doctor.getSex() %></td>
                <td><%=doctor.getAge()%></td>
                <td><%=doctor.getPhone()%></td>
                <td><%=doctor.getPart() %></td>
                <td><%=doctor.getPart2() %></td>
                <td><%=doctor.getPart3()%></td>
                <td><%=doctor.getDiscript()%></td>
                <td>
                    <label>
                        <input type="hidden" name="Id" value="<%=doctor.getId()%>">
                    </label>
                    <%--                    <button class="button" type="submit" onclick="DeletePatient(<%=doctor.getId()%>); return false;">删除用户</button>--%>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>


<div style="display: flex; justify-content: center;">
    <a href="DoctorUpdate.jsp?id=<%=id%>" style="margin-right: 10px; display: flex; justify-content: center; align-items: center;">
        <input type="button" class="button" value="修改个人信息">
    </a>
    <a href="DoctorSickShow.jsp?id=<%=id%>" style="display: flex; justify-content: center; align-items: center;">
        <input type="button" class="button" value="病人数据">
    </a>
</div>


<div class="bottom-bar"></div>

</body>
