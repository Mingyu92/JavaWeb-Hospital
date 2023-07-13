<%
    int UserID;
    if (request.getAttribute("UserID")!= null) {
        UserID = (int) (request.getAttribute("UserID"));
    } else {
        UserID = Integer.parseInt(request.getParameter("UserID"));
    }
%><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.service.PatientService" %>
<%@ page import="hospital.user.Patient" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.HospitalDaoImpl" %>
<%@ page import="hospital.user.Hospital" %>
<%@ page import="hospital.user.Sick" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <link rel="stylesheet" href="css/navbar.css">

</head>
<body>
<h1>桂林市医院统一预约挂号服务平台</h1>
<div>
    <!-- 导航栏 -->
    <ul class="navbar">
        <li><a href="./PatientCenter.jsp?UserID=<%= UserID %>">首页</a></li>
        <li><a href="./PatientShow.jsp?UserID=<%= UserID %>">个人信息</a></li>
        <li><a href="./PatientSelectHospital.jsp?UserID=<%= UserID %>">预约挂号</a></li>
        <li><a href="./PatientSickShow.jsp?UserID=<%= UserID %>">查看挂号信息</a></li>
    </ul>
</div>

<div>
    <h1>挂号信息</h1>
    <%
        PatientService patientService = new PatientService();
        int patientId = Integer.parseInt(request.getParameter("UserID"));
        List<Sick> sickList = patientService.SickShow(patientId);
        assert sickList != null;
    %>
    <div>
        <table>
            <thead>
            <tr>
                <th>主治医生</th>
                <th>预约日期</th>
                <th>预约时间段</th>
                <th>医院名</th>
                <th>科室名</th>
                <th>预约状态</th>
                <th>支付状态</th>
                <th>支付金额</th>
                <th></th>
                <th></th>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <%for (Sick s : sickList) {
            %>
            <tr>
                <td><%= s.getD_name() %></td>
                <td><%= s.getData() %></td>
                <td><%= s.getTime() %></td>
                <td><%= s.getHospitalname() %></td>
                <td><%= s.getDepartmentname() %></td>
                <td><%= s.getAppointmentstatus() %></td>
                <td><%= s.getPaymentstatus() %></td>
                <td><%= s.getPaymentamount() %></td>
                <td>
                    <form action="PatientSickDelete" method="POST">
                        <input type="hidden" name="UserID" value="<%= s.getPatientId() %>">
                        <input type="hidden" name="AppointmentID" value="<%= s.getId() %>">
                        <input type="submit" value="取消">
                    </form>
                </td>
                <td>
                    <form>
                        <a href="PatientSickUpdate.jsp?UserID=<%= s.getPatientId() %>&AppointmentID=<%= s.getId() %>">
                            <input type="button" value="修改" >
                        </a>
                    </form>
                </td>
                <td>
                    <form action="PatientSickPayment" method="POST">
                        <input type="hidden" name="UserID" value="<%= s.getPatientId() %>">
                        <input type="hidden" name="AppointmentID" value="<%= s.getId() %>">
                        <input type="submit" value="缴费" <%= s.getPaymentstatus().equals("已缴费") ? "disabled" : "" %>>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<%--</table>--%>
<%--<a href="PatientSickAdd.jsp?patientId=<%= patientId %>">--%>
<%--    <input type="button" value="新增挂号数据">--%>
<%--</a>--%>
<% if (request.getAttribute("Errormessage") != null) { %>
<script>
    showMessage("<%= request.getAttribute("Errormessage") %>");
</script>
<% } %>
</body>
</html>