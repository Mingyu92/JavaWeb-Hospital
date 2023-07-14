package hospital.servlet;
import hospital.user.Hospital;
import hospital.dao.impl.HospitalDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddHospitalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单提交的数据
        String A_Name = request.getParameter("A_Name");
        String name = request.getParameter("name");
        String level = request.getParameter("level");
        String address = request.getParameter("address");
        String number = request.getParameter("number");
        String presidentName = request.getParameter("presidentname");
        String time = request.getParameter("time");
        String status = request.getParameter("status");
        String introduction = request.getParameter("introduction");

        // 创建医院对象，并设置属性值
        Hospital hospital = new Hospital();
        hospital.setName(name);
        hospital.setLevel(level);
        hospital.setAddress(address);
        hospital.setNumber(number);
        hospital.setPresidentname(presidentName);
        hospital.setTime(time);
        hospital.setStatus(status);
        hospital.setIntroduction(introduction);

        // 调用 DAO 层的方法将医院对象保存到数据库
        HospitalDaoImpl hospitalDaoImpl = new HospitalDaoImpl();
        hospitalDaoImpl.add(hospital);

        // 重定向到医院管理页面
        response.sendRedirect("./AdminHospitals.jsp?A_Name=" + A_Name);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
