<%@ page import="hospital.user.Hospital" %>
<%@ page import="hospital.service.AdminService" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.user.Department" %>
<%@ page import="hospital.user.Doctor" %>
<%@ page import="hospital.service.DoctorService" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/20
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新挂号数据</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>更新挂号数据</h1>
    <form action="PatientSickUpdate" method="post">
        <input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>">
        <input type="hidden" name="AppointmentID" value="<%=request.getParameter("AppointmentID")%>">
        <label for="AppointmentDate">预约日期</label>
        <input type="date" name="AppointmentDate" id="AppointmentDate" min="<%= java.time.LocalDate.now() %>">
        <label for="AppointmentTime">预约时间段</label>
        <select name="AppointmentTime" id="AppointmentTime">
            <option value="8:00-9:00">8:00-9:00</option>
            <option value="9:00~10:00">9:00~10:00</option>
            <option value="10:00~11:00">10:00~11:00</option>
            <option value="11:00~12:00">11:00~12:00</option>
            <option value="12:00~13:00">12:00~13:00</option>
            <option value="13:00~14:00">13:00~14:00</option>
            <option value="14:00~15:00">14:00~15:00</option>
            <option value="15:00~16:00">15:00~16:00</option>
            <option value="16:00~17:00">16:00~17:00</option>
            <option value="17:00~18:00">17:00~18:00</option>
        </select>
        <input type="submit" value="更新">
        <input type="reset" value="重置">
    </form>
    <% if (request.getAttribute("Errormessage") != null) { %>
    <script>
        showMessage("<%= request.getAttribute("Errormessage") %>");
    </script>
    <% } %>
</div>
<script>
    function showMessage(message) {
        alert(message);
    }
</script>
</body>
</html>
